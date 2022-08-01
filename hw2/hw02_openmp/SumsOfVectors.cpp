#pragma clang diagnostic push
#pragma ide diagnostic ignored "openmp-use-default-none"
// V teto domaci uloze se Vas budeme snazit presvedcit, ze vykon vasi implementace zavisi do znacne miry na podobe
// vstupnich dat. Pri navrhu efektivnich algoritmu byste se tedy meli rozhodovat i na zaklade datove sady.
//
// Vasim ukolem je doimplementovat 4 ruzne metody na pocitani sumy kazdeho vstupniho vektoru ("data").
// V kazde metode budete pouzitivat OpenMP, ale pokazde trochu jinym zpusobem. Rychlost vypoctu Vasi implementace
// budeme porovnavat s nasi referencni implementaci. Vychazet muzete z metody sumsOfVectors_sequential implementovane
// v _executor/Executor.cpp.

#include <iostream>
#include <numeric>
#include <algorithm>
#include <random>
#include <omp.h>
#include "SumsOfVectors.h"

void
sumsOfVectors_omp_per_vector(const vector<vector<int8_t>> &data, vector<long> &solution, unsigned long minVectorSize) {
    for (unsigned long i = 0; i < data.size(); i++) {
        long sum = 0;
#pragma omp parallel for default(none) shared(data, i) reduction(+:sum)
        for(unsigned long j = 0; j < data[i].size(); j++){
        //for (const int8_t &j : data[i]) {
            sum += data[i][j];
        }
        solution[i] = sum;
    }
    // V teto metode si vyzkousite paralelizaci na urovni vektoru. Naimplementujte paralelni pristup
    // k vypocteni sum jednotlivych vektoru (sumu vektoru data[i] ulozte do solution[i]). V teto
    // funkci zpracovavejte jednotlive vektory sekvencne a paralelizujte nalezeni sumy v jednom
    // konkretnim vektoru. Tento pristup by mel byt zejmena vhodny, pokud mate maly pocet vektoru
    // velke delky.
}

void sumsOfVectors_omp_static(const vector<vector<int8_t>> &data, vector<long> &solution,
                              unsigned long minVectorSize) {
#pragma omp parallel for default(none) shared(data, solution) schedule(static)
    for (unsigned long i = 0; i < data.size(); i++) {
        long sum = 0;
        for(unsigned long j = 0; j < data[i].size(); j++){
            sum += data[i][j];
        }
        solution[i] = sum;
    }
    // Pokud vektory, ktere zpracovavame nejsou prilis dlouhe, ale naopak jich musime zpracovat
    // velky pocet, muzeme zparalelizovat vnejsi for smycku, ktera prochazi pres jednotlive
    // vektory. Vyuzijte paralelizaci pres #pragma omp parallel for se statickym schedulingem.
}

void sumsOfVectors_omp_dynamic(const vector<vector<int8_t>> &data, vector<long> &solution,
                               unsigned long minVectorSize) {
    unsigned long size = data.size();
#pragma omp parallel for default(none) shared(size, data, solution) schedule(dynamic)
    for (unsigned long i = 0; i < size; i++) {
        long sum = 0;
        unsigned long size_2 = data[i].size();
        for(unsigned long j = 0; j < size_2; j++){
            sum += data[i][j];
        }
        solution[i] = sum;
    }
    // Na cviceni jsme si ukazali, ze staticky scheduling je nevhodny, pokud praci mezi
    // jednotliva vlakna nedokaze rozdelit rovnomerne. V teto situaci muze byt vhodnym
    // resenim pouzitim dynamickeho schedulingu. Ten je rovnez vhodny v situacich, kdy
    // nevime predem, jak dlouho budou jednotlive vypocty trvat. Dani za to je vyssi
    // rezie pri zjistovani indexu 'i', ktery ma vlakno v dane chvili zpracovavat.
}

void sumsOfVectors_omp_shuffle(const vector<vector<int8_t>> &data, vector<long> &solution,
                               unsigned long minVectorSize) {
    std::vector<int> array_num(data.size());
    std::iota(array_num.begin(), array_num.end(), 0);
    std::shuffle(array_num.begin(), array_num.end(), std::mt19937(std::random_device()()));
    unsigned long size = data.size();
#pragma omp parallel for default(none) shared(array_num, solution,data) schedule(static)
    for (unsigned long i = 0; i < data.size(); i++) {
        long sum = 0;
        unsigned long size_2 = data[array_num[i]].size();
        for(unsigned long j = 0; j < size_2; j++){
            sum += data[array_num[i]][j];
            //for (const int8_t &j : data[array_num[i]]) {
            //sum += j;
        }
        solution[array_num[i]] = sum;
    }
    // Dalsi moznosti, jak se vyhnout problemum pri pouziti statickeho schedulingu (tj.,
    // zejmena nevyvazenemu rozdeleni prace) je predzpracovani dat. V teto funkci zkuste
    // data pred zparalelizovanim vnejsi for smycky (se statickym schedulingem) nejprve
    // prohazet. To samozrejme predpoklada, ze cas potrebny na predzpracovani je radove
    // mensi, nez zisk, ktery ziskame nahrazenim dynamickeho schedulingu za staticky.
    //
    // Tip: Abyste se vyhnuli kopirovani vektoru pri "prohazovani" (ktere muze byt velmi
    // drahe!), muzete prohazovat pouze pointery na vektory. Alternativou je vytvorit si
    // nejprve pole nahodne serazenych indexu a ty pak pouzit pro pristup k poli.
    // Uzitecnymi metodami mohou byt metody std::iota(...) (ktera Vam vygeneruje posloupnost
    // indexu) a std::random_shuffle(...), ktera zajisti nahodne prohazeni prvku.
}

#pragma clang diagnostic pop