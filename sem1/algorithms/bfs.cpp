#include <set>
#include <algorithm>
#include <queue>
#include <omp.h>
#include <unordered_set>
#include "bfs.h"

// Naimplementujte efektivni algoritmus pro nalezeni nejkratsi cesty v grafu.
// V teto metode nemusite prilis optimalizovat pametove naroky, a vhodnym algo-
// ritmem tak muze byt napriklad pouziti prohledavani do sirky (breadth-first
// search.
//
// Metoda ma za ukol vratit ukazatel na cilovy stav, ktery je dosazitelny pomoci
// nejkratsi cesty.

std::shared_ptr<const state> bfs(std::shared_ptr<const state> root) {
    std::shared_ptr<const state> best_result = nullptr;
    std::set <unsigned long long> visited;
    //std::vector<std::shared_ptr<const state>> queue;
    std::queue<std::shared_ptr<const state>> queue;
    auto max_cost = 0;

    if (root->is_goal()) return root;

    visited.insert(root->get_identifier());

    //LINK: https://en.wikipedia.org/wiki/Parallel_breadth-first_search

    //for
    auto next_states_neighbor = root->next_states();
    for(auto first_neighbor : next_states_neighbor){
        if(first_neighbor->is_goal()) {
            return first_neighbor;
        }
        visited.insert(first_neighbor->get_identifier());
        queue.push(first_neighbor);
    }
    //while
        //for
            //for

    while(!queue.empty()) {
        unsigned long size_queue = queue.size();
#pragma omp parallel for
        for (unsigned long i = 0; i < size_queue; i++) {
        std::shared_ptr<const state> current_node;
#pragma omp critical
            {
            current_node = queue.front();
            queue.pop();
            };
            auto neighbours = current_node->next_states();
            unsigned long size_neighbours = neighbours.size();


            for(unsigned long j = 0; j < size_neighbours; j++) {
                auto actual_cost = neighbours[j]->current_cost();
                auto actual_id = neighbours[j]->get_identifier();

                if (neighbours[j]->is_goal()) {
                    if (actual_cost < max_cost || best_result == nullptr) {
                        max_cost = actual_cost;
                        best_result = neighbours[j];

                    }else if(actual_cost == max_cost &&
                        actual_id < best_result->get_identifier()){

                        best_result = neighbours[j];
                    }

                }else if (best_result == nullptr){
#pragma omp critical
                    if(visited.find(actual_id) == visited.end()) {
                        queue.push(neighbours[j]);
                        visited.insert(actual_id);
                    }
                }

            }
            if(best_result != nullptr) {
#pragma omp cancel for
            }
            //if(best_result != nullptr) return best_result;
        }
    }
    return best_result;
}