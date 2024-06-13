#include<omp.h>
#include<iostream>
#include<time.h>
using namespace std;
int main()
{
	int n;
	cout<<"Enter the number of elements : ";
	cin>>n;
	cout<<endl;

	int array[n] = {0};

	for(int i=0;i<n;i++) array[i]=rand()%32;
	
	cout<<"Original Array: ";
	for(int i=0; i<n; i++) cout<<array[i]<<" ";
	cout<<endl;
	
	clock_t start=clock();
	int var = 0;

	for(int i=0; i<n; i++)
	{
		#pragma omp parallel for
		for(int j=var; j<n-1; j+=2)
		{
			if(array[j] > array[j+1])
			{
				int temp = array[j];
				array[j] = array[j+1];
				array[j+1] = temp;
			}
		}
		
		if(var == 0) var = 1;
		else var = 0;

	}	

	clock_t stop=clock();
	
	
	cout<<"\nFinal Array: ";
	for(int i=0; i<n; i++) cout<<array[i]<<" ";
	cout<<endl;	
	
	cout<<"\nTime required : "<<(double)(stop-start)<<" ms"<<endl;
	return 0;
}

