#include <functional>
#include "bst_tree.h"

void bst_tree::insert(long long data) {
    node * new_node = new node(data);
    node * current = root;
    node * next = nullptr;

    while(true){

        if(root == nullptr){
            root = new_node;
            return;
        }

        if (data < current->data){
            next = current->left;
            if(next == nullptr && current->left.compare_exchange_strong(next, new_node)){
                return;
            }
            current = current->left;
        }else{
            next = current->right;
            if(next == nullptr && current->right.compare_exchange_strong(next, new_node)){
                return;
            }
            current = current->right;
        }
    }
}

bst_tree::~bst_tree() {
    // Rekurzivni funkce pro pruchod stromu a dealokaci pameti prirazene jednotlivym
    // uzlum
    std::function<void(node*)> cleanup = [&](node * n) {
        if(n != nullptr) {
            cleanup(n->left);
            cleanup(n->right);

            delete n;
        }
    };
    cleanup(root);
}
