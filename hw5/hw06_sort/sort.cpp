#include "sort.h"
#include <iostream>

void my_sort(std::vector<std::string *> &vector_to_sort, const MappingFunction &mappingFunction,
                unsigned long alphabet_size, unsigned long string_lengths, const unsigned int index){
    if(index == string_lengths)
        return;

    std::vector<std::string *> buckets[alphabet_size];

    for(auto ptr : vector_to_sort){
        const unsigned long character = mappingFunction((*ptr).at(index));
        buckets[character].push_back(ptr);
    }
#pragma omp parallel for
    for(unsigned long i = 0; i < alphabet_size; i++){
        my_sort(buckets[i], mappingFunction, alphabet_size, string_lengths, index+1);
    }


    int index_for_sort = 0;
    for(unsigned long  i = 0; i < alphabet_size; i++){
        int j = buckets[i].size();
	    for(int k = 0; k < j; k++){
	      vector_to_sort[index_for_sort++] = buckets[i][k];
	    }
	//while(!buckets[i].empty()){
        //    vector_to_sort[index_for_sort++] = *(buckets[i].begin());
        //    buckets[i].erase(buckets[i].begin());
        //}
    }

}

// implementace vaseho radiciho algoritmu. Detalnejsi popis zadani najdete v "sort.h"
void radix_par(std::vector<std::string *> &vector_to_sort, const MappingFunction &mappingFunction,
               unsigned long alphabet_size, unsigned long string_lengths) {

    my_sort(vector_to_sort, mappingFunction, alphabet_size, string_lengths, 0);
    // sem prijde vase implementace. zakomentujte tuto radku
    //throw "Not implemented.";

    // abeceda se nemeni. jednotlive buckety by mely reprezentovat znaky teto abecedy. poradi znaku v abecede
    // dostanete volanim funkce mappingFunction nasledovne: mappingFunction((*p_retezec).at(poradi_znaku))

    // vytvorte si spravnou reprezentaci bucketu, kam budete retezce umistovat

    // pro vetsi jednoduchost uvazujte, ze vsechny retezce maji stejnou delku - string_lengths. nemusite tedy resit
    // zadne krajni pripady

    // na konci metody by melo byt zaruceno, ze vector pointeru - vector_to_sort bude spravne serazeny.
    // pointery budou serazeny podle retezcu, na ktere odkazuji, kdy retezcu jsou serazeny abecedne

}
