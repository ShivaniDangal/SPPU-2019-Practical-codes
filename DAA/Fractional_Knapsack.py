class Item:
    def __init__(self, profit, weight):
        self.profit= profit
        self.weight= weight
    
def fractional_knapsack(w, arr):
    arr.sort(key= lambda x: x.profit/x.weight, reverse= True)
    final_profit= 0.0
    
    for item in arr:
        if item.weight<=w:
            final_profit+= item.profit
            w-= item.weight
        else:
            final_profit+= item.profit* (w/item.weight)
            break
        
    return final_profit
    
if __name__== "__main__":
    num= int(input("Enter number of items: "))
    arr= []
    for i in range(num):
        profit= int(input("Enter profit of item "+str(i+1)+": "))
        weight= int(input("Enter weight of item "+str(i+1)+": "))
        arr.append(Item(profit,weight))
        
    w= int(input("Enter the capacity of knapsack: "))
    print("Final Profit: ",fractional_knapsack(w,arr))
