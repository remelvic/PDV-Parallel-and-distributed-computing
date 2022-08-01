#ifndef PRODUCENTCONSUMER_THREADPOOL_H
#define PRODUCENTCONSUMER_THREADPOOL_H

#include <list>
#include <thread>
#include <vector>
#include <iostream>
#include <condition_variable>

template<typename job_t, typename worker_t>
class ThreadPool {
private:
    // Fronta uloh
    std::list<job_t> queue;

    // Vlakna konzumentu zpracovavajicich ulohy
    std::vector<std::thread> threads;

    // Funkce, kterou maji konzumenti vykonavat
    const worker_t & worker;

    std::condition_variable cond;
    std::mutex lock;

public:
    ThreadPool(const unsigned int num_threads, const worker_t & worker);
    void process(const job_t job);
    void join();
};

template<typename job_t, typename worker_t>
ThreadPool<job_t, worker_t>::ThreadPool(const unsigned int num_threads, const worker_t &worker) : worker(worker) {

    // Zde vytvorte "num_threads" vlaken konzumentu:
    //   - Po spusteni bude vlakno kontrolovat, zda je ve fronte uloh "queue" nejaka
    //     uloha ke zpracovani, tj., fronta neni prazdna - !queue.empty()
    //   - Ve chvili, kdy je ve fronte uloha ke zpracovani, tak ulohu z fronty vyjme
    //     a zavola worker(task), kde task je uloha ke zpracovani (priklad pouziti
    //     naleznete nize).
    //   - Vlakno se ukonci pokud uloha ke zpracovani je 0
    //   - Vytvorena vlakna vlozte do pole "threads"
    for (int i = 0; i < num_threads; i++) {
        threads.push_back(std::thread([&]() {
            job_t task;

        do {
            std::unique_lock<std::mutex> l (lock);
            cond.wait(l, [this]() { return !queue.empty(); } );         //remelvic: Jestli fronta prazdna tak vrati true, ale
                                                                // potrebujeme jsme aby vratila false, aby se vlakno
                                                                // muselo cekat na odeslani processem nejakeho tasku
            //while(queue.empty());     // Cekame, nez se ve fronte objevi nejaka uloha                                     
                                      // Ve Vasi implementaci zkuste nahradit toto aktivni cekani
                                      // pomoci podminkove promenne (condition_variable)

            // Pote ji zpracujeme:
            task = queue.front();        // Precteme prvni ulohu ve fronte
            queue.pop_front();           // A ulohu odstranime
            l.unlock();
            if(task != 0) worker(task);  // Na zaver zavolame "worker" funkci, ktera ulohu vykona
        } while(task != 0);              // Pokud je "zpracovana" uloha 0, skoncime
        }));
    }
    // Tento kod nesplnuje zadani z nekolika duvodu:
    //   - Spousti pouze jedno vlakno konzumenta. Pokud vykonani uloh pomoci worker(task)
    //     trva delsi dobu a konzument nestiha ulohy zpracovavat, zacnou se nam ulohy ve
    //     fronte hromadit. Vypocet muzeme zrychlit tim, ze si vice konzumentu podeli o
    //     ulohy ke zpracovani
    //   - Pokud vice uloh pristupuje ke fronte uloh, vysledek neni predvidatelny. Muze
    //     se nam pak stat, ze se jedna uloha zpracuje vicekrat, nebo naopak na nejakou
    //     ulohu zapomeneme. Zajistete vylucny pristup ke fronte uloh "queue" za pouziti
    //     mutexu.

    // Nezapomente, ze v kriticke sekci chceme travit co nejmene casu (tj., uvolnovat zamek
    // ihned pote, co uz ho prestaneme potrebovat). Napriklad si dejte pozor na to, abyste
    // zamek uvolnili pred tim, nez spustite vypocet ulohy pomoci worker(task). Pokud by
    // totiz vypocet ulohy byl soucasti kriticke sekce, mohla by se v danou chvili pocitat
    // pouze jedna uloha - a prisli bychom o vyhody paralelizace.
}

template<typename job_t, typename worker_t>
void ThreadPool<job_t, worker_t>::process(const job_t job) {
    // Bezpecne vlozte ulohu "job" do fronty uloh "queue"
    std::unique_lock<std::mutex> l(lock);
    // Pridat ulohu do fronty muzeme nasledujicim volanim:
    queue.push_back(job);
    l.unlock();
    cond.notify_one();

    // Pokud timto zpusobem bude ale vice vlaken bude pristupovat ke fronte soucasne,
    // vysledek neni determinsticky. Mohlo by se nam napriklad stat, ze nam jine
    // vlakno nasi pridanou ulohu "prepise" a ta se tak ztrati.
    // Zabezpecte, ze k tomuto nemuze dojit.
}

// Tato metoda nam umozni volajici funkci v main.cpp pockat na vsechna spustena vlakna konzumentu
template<typename job_t, typename worker_t>
void ThreadPool<job_t, worker_t>::join() {
    for(unsigned int i = 0 ; i < threads.size() ; i++) threads[i].join();
}

#endif //PRODUCENTCONSUMER_THREADPOOL_H
