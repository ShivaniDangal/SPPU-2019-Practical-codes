#include<iostream>

using namespace std;

void Non_recursive_fibo(int num){
    int n1=0,n2=1,n3;
    cout<<n1<<" "<<n2<<" ";
    for(int i=2; i<num; i++){
        n3= n1+n2;
        cout<<n3<<" ";
        n1=n2; 
        n2=n3;
    }
}

//time complexity:O(n)->n recursive calls
//space complexity:O(n)->recursive function call stack can grow to a depth of n,and each stack frame requires some space to store the function call parameters.
void Recursive_fibo(int num){
    static int n1=0,n2=1,n3;
    if(num>0){
        n3=n1+n2;
        cout<<n3<<" ";
        n1=n2;
        n2=n3;
        Recursive_fibo(num-1);
    }
}

int main(){
    int ch, num;
    cout<<"Enter the number of elements: ";
    cin>>num;
    do{
        cout<<"\n1]Non-recursive\n2]Recursive\n3]Exit"<<endl;
        cout<<"Enter your choice: ";
        cin>>ch;
        switch(ch){
            case 1:
                Non_recursive_fibo(num);
                break;
            case 2:
                cout<<0<<" "<<1<<" ";
                Recursive_fibo(num-2);
                break;
        }
    }
    while(ch!=3);
}
