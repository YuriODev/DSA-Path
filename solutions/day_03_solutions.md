# Solutions for Day 3 🚀

## Overview

This document provides a comprehensive overview of **space complexity** analysis. We discuss how much extra memory an algorithm requires (its auxiliary space), the impact of recursion (e.g., call stacks), and compare in-place versus out-of-place algorithms. Detailed examples, tables, and explanations are provided to help you master these concepts.

## Exercises

### Exercise 1: In-Place Reversal Space Complexity 📊

> **Question:**  
> Evaluate the space complexity of the following function that reverses an array *in-place*.

> ```cpp
> // C++
> void reverseArray(vector<int>& arr) {
>     int left = 0, right = arr.size() - 1;
>     while (left < right) {
>         swap(arr[left], arr[right]);
>         ++left;
>         --right;
>     }
> }
> ```

> ```python
> # Python
> def reverse_array(arr):
>     left, right = 0, len(arr) - 1
>     while left < right:
>         arr[left], arr[right] = arr[right], arr[left]
>         left += 1
>         right -= 1
> ```
> **Answer Options:**
> 
> 1. $O(1)$  
> 2. $O(n)$  
> 3. $O(n^2)$  
> 4. $O(\log n)$

<details close>
<summary><b>Show Solution</b></summary>
<div markdown="1">

**Explanation:**  
The function performs the reversal by swapping elements in the original array and only uses a few extra variables (`left` and `right`). These variables occupy constant space regardless of the input size.

**Auxiliary Space Complexity:** $O(1)$.

**Final Answer:**  
$\boxed{O(1)}$
</div>
</details>



### Exercise 2: Recursive Fibonacci Space Complexity 📊

> **Question:**  
> Evaluate the space complexity of the following recursive Fibonacci function, considering the call stack space.
> $$
> \text{fib}(n) =
> \begin{cases}
> n, & \text{if } n \leq 1 \\
> \text{fib}(n - 1) + \text{fib}(n - 2), & \text{otherwise}
> \end{cases}
> $$


> ```cpp
> // C++
> int fib(int n) {
>     if (n <= 1) return n;
>     return fib(n - 1) + fib(n - 2);
> }
> ```

> ```python
> # Python
> def fib(n):
>     if n <= 1:
>         return n
>     return fib(n - 1) + fib(n - 2)
> ```

> **Answer Options:**
> 
> 1. $O(1)$  
> 2. $O(n)$  
> 3. $O(2^n)$  
> 4. $O(\log n)$

<details close>
<summary><b>Show Solution</b></summary>
<div markdown="1">

**Explanation:**  
Each recursive call adds a new frame to the call stack. Although the total number of calls is exponential, the maximum depth of recursion (i.e., the height of the recursion tree) is $O(n)$. Each call uses constant space.

**Auxiliary Space Complexity:** $O(n)$.

**Final Answer:**  
$\boxed{O(n)}$
</div>
</details>



### Exercise 3: Copying an Array Space Complexity 📊

> **Question:**  
> Evaluate the space complexity of the following function that creates a copy of an array.

> ```cpp
> // C++
> vector<int> copyArray(const vector<int>& arr) {
>     vector<int> newArr(arr.size());
>     for (size_t i = 0; i < arr.size(); ++i) {
>         newArr[i] = arr[i];
>     }
>     return newArr;
> }
> ```

> ```python
> # Python
> def copy_array(arr):
>     new_arr = arr.copy()
>     return new_arr
> ```

> **Answer Options:**
> 
> 1. $O(1)$  
> 2. $O(\log n)$  
> 3. $O(n)$  
> 4. $O(n^2)$

<details close>
<summary><b>Show Solution</b></summary>
<div markdown="1">

**Explanation:**  
The function creates a new array of the same size as the input, requiring extra memory proportional to the number of elements.

**Auxiliary Space Complexity:** $O(n)$.

**Final Answer:**  
$\boxed{O(n)}$
</div>
</details>



### Exercise 4: Merge Sort Space Complexity 📊

> **Question:**  
> Evaluate the auxiliary space complexity of the merge sort algorithm's merge step.

> ```cpp
> // C++
> void merge(vector<int>& arr, int left, int mid, int right) {
>     vector<int> temp(right - left + 1);
>     int i = left, j = mid + 1, k = 0;
>     while (i <= mid && j <= right) {
>         if (arr[i] <= arr[j])
>             temp[k++] = arr[i++];
>         else
>             temp[k++] = arr[j++];
>     }
>     while (i <= mid) temp[k++] = arr[i++];
>     while (j <= right) temp[k++] = arr[j++];
>     for (int p = 0; p < temp.size(); ++p)
>         arr[left + p] = temp[p];
> }
> ```

> ```python
> # Python
> def merge(arr, left, mid, right):
>     temp = []
>     i, j = left, mid + 1
>     while i <= mid and j <= right:
>         if arr[i] <= arr[j]:
>             temp.append(arr[i])
>             i += 1
>         else:
>             temp.append(arr[j])
>             j += 1
>     while i <= mid:
>         temp.append(arr[i])
>         i += 1
>     while j <= right:
>         temp.append(arr[j])
>         j += 1
>     arr[left:right+1] = temp
> ```

> **Answer Options:**
> 
> 1. $O(1)$  
> 2. $O(\log n)$  
> 3. $O(n)$  
> 4. $O(n \log n)$

<details close>
<summary><b>Show Solution</b></summary>
<div markdown="1">

**Explanation:**  
The merge step creates a temporary array whose size is proportional to the number of elements being merged (i.e., $right - left + 1$). Although merge sort uses recursion, at any one time the auxiliary space is dominated by the temporary array used for merging.

**Auxiliary Space Complexity:** $O(n)$.

**Final Answer:**  
$\boxed{O(n)}$
</div>
</details>



### Exercise 5: In-Place Heapify Space Complexity 📊

> **Question:**  
> Evaluate the space complexity of the following heapify function used in heap sort.

> ```cpp
> // C++
> void heapify(vector<int>& arr, int n, int i) {
>     int largest = i;
>     int left = 2 * i + 1;
>     int right = 2 * i + 2;
>     if (left < n && arr[left] > arr[largest])
>         largest = left;
>     if (right < n && arr[right] > arr[largest])
>         largest = right;
>     if (largest != i) {
>         swap(arr[i], arr[largest]);
>         heapify(arr, n, largest);
>     }
> }
> ```

> ```python
> # Python
> def heapify(arr, n, i):
>     largest = i
>     left = 2 * i + 1
>     right = 2 * i + 2
>     if left < n and arr[left] > arr[largest]:
>         largest = left
>     if right < n and arr[right] > arr[largest]:
>         largest = right
>     if largest != i:
>         arr[i], arr[largest] = arr[largest], arr[i]
>         heapify(arr, n, largest)
> ```
    
> **Answer Options:**
> 
> 1. $O(1)$  
> 2. $O(n)$  
> 3. $O(\log n)$  
> 4. $O(n \log n)$

<details close>
<summary><b>Show Solution</b></summary>
<div markdown="1">

**Explanation:**  
The heapify function works in place on the array and uses recursion. The maximum depth of the recursion (i.e., the height of the heap) is $O(\log n)$. Thus, the extra space used by the recursion call stack is $O(\log n)$.

**Auxiliary Space Complexity:** $O(\log n)$.

**Final Answer:**  
$\boxed{O(\log n)}$
</div>
</details>



### Exercise 6: Frequency Count Using Hash Map Space Complexity 📊

> **Question:**  
> Evaluate the auxiliary space complexity of the following function that counts the frequency of each element in an array.

> ```cpp
> // C++
> unordered_map<int, int> frequencyCount(const vector<int>& arr) {
>     unordered_map<int, int> freq;
>     for (int num : arr) {
>         freq[num]++;
>     }
>     return freq;
> }
> ```

> ```python
> # Python
> from collections import Counter
> def frequency_count(arr):
>     return Counter(arr)
> ```
> **Answer Options:**
> 
> 1. $O(1)$  
> 2. $O(n)$  
> 3. $O(n^2)$  
> 4. $O(\log n)$

<details close>
<summary><b>Show Solution</b></summary>
<div markdown="1">

**Explanation:**  
In the worst-case scenario, every element in the array is distinct, so the hash map (or Counter) will store $n$ key-value pairs.

**Auxiliary Space Complexity:** $O(n)$.

**Final Answer:**  
$\boxed{O(n)}$
</div>
</details>



### Exercise 7: Generating All Subsets Space Complexity 📊

> **Question:**  
> Evaluate the space complexity of the following function that generates all subsets of an array of size $n$.

> ```cpp
> // C++
> vector<vector<int>> generateSubsets(vector<int>& nums) {
>     int n = nums.size();
>     vector<vector<int>> subsets;
>     int total = 1 << n; // 2^n subsets
>     for (int mask = 0; mask < total; ++mask) {
>         vector<int> subset;
>         for (int i = 0; i < n; ++i) {
>             if (mask & (1 << i))
>                 subset.push_back(nums[i]);
>         }
>         subsets.push_back(subset);
>     }
>     return subsets;
> }
> ```

> ```python
> # Python
> def generate_subsets(nums):
>     n = len(nums)
>     subsets = []
>     total = 1 << n  # 2^n subsets
>     for mask in range(total):
>         subset = [nums[i] for i in range(n) if mask & (1 << i)]
>         subsets.append(subset)
>     return subsets
> ```
> **Answer Options:**
> 
> 1. $O(n)$  
> 2. $O(2^n)$  
> 3. $O(n \cdot 2^n)$  
> 4. $O(2^{2n})$

<details close>
<summary><b>Show Solution</b></summary>
<div markdown="1">

**Explanation:**  
The function generates all $2^n$ subsets, and each subset can have up to $n$ elements. Thus, the total space required to store all subsets is proportional to $n \times 2^n$.

**Auxiliary Space Complexity:** $O(n \cdot 2^n)$.

**Final Answer:**  
$\boxed{O(n \cdot 2^n)}$
</div>
</details>



### Exercise 8: Depth-First Search (DFS) Space Complexity 📊

> **Question:**  
> Evaluate the auxiliary space complexity of the following DFS function that explores a graph recursively.

> ```cpp
> // C++
> void dfs(int node, const vector<vector<int>>& adj, vector<bool>& visited) {
>     visited[node] = true;
>     for (int neighbor : adj[node]) {
>         if (!visited[neighbor]) {
>             dfs(neighbor, adj, visited);
>         }
>     }
> }
> ```

> ```python
> # Python
> def dfs(node, adj, visited):
>     visited[node] = True
>     for neighbor in adj[node]:
>         if not visited[neighbor]:
>             dfs(neighbor, adj, visited)
> ```
> **Answer Options:**
> 
> 1. $O(1)$  
> 2. $O(n)$  
> 3. $O(n^2)$  
> 4. $O(\log n)$

<details close>
<summary><b>Show Solution</b></summary>
<div markdown="1">

**Explanation:**  
The DFS algorithm uses recursion to traverse the graph. In the worst-case (e.g., a graph resembling a linked list), the recursion depth can reach $O(n)$.

**Auxiliary Space Complexity:** $O(n)$.

**Final Answer:**  
$\boxed{O(n)}$
</div>
</details>



### Exercise 9: In-Place QuickSort Space Complexity 📊

> **Question:**  
> Evaluate the auxiliary space complexity of the in-place QuickSort algorithm, considering the recursion stack usage.

> ```cpp
> // C++
> void quickSort(vector<int>& arr, int left, int right) {
>     if (left < right) {
>         int pivot = partition(arr, left, right);
>         quickSort(arr, left, pivot - 1);
>         quickSort(arr, pivot + 1, right);
>     }
> }
> ```

> ```python
> # Python
> def quick_sort(arr, left, right):
>     if left < right:
>         pivot = partition(arr, left, right)
>         quick_sort(arr, left, pivot - 1)
>         quick_sort(arr, pivot + 1, right)
> ```
> **Answer Options:**
> 
> 1. $O(1)$  
> 2. $O(\log n)$  
> 3. $O(n)$  
> 4. $O(n \log n)$

<details close>
<summary><b>Show Solution</b></summary>
<div markdown="1">

**Explanation:**  
QuickSort sorts the array in place, but its recursive implementation uses extra space for the call stack. In the worst-case (when the pivot is the smallest or largest element each time), the recursion depth can be $O(n)$. Although the average recursion depth is $O(\log n)$, for worst-case analysis we consider $O(n)$.

**Auxiliary Space Complexity (Worst-Case):** $O(n)$.

**Final Answer:**  
$\boxed{O(n)}$
</div>
</details>



### Exercise 10: Linked List Merge Sort Space Complexity 📊

> **Question:**  
> Evaluate the auxiliary space complexity of merge sorting a linked list using a recursive approach.

> ```cpp
> // C++
> ListNode* mergeSort(ListNode* head) {
>     if (!head || !head->next)
>         return head;
>     ListNode* mid = getMiddle(head);
>     ListNode* left = mergeSort(head);
>     ListNode* right = mergeSort(mid);
>     return merge(left, right);
> }
> ```

> ```python
> # Python
> def merge_sort(head):
>     if not head or not head.next:
>         return head
>     mid = get_middle(head)
>     left = merge_sort(head)
>     right = merge_sort(mid)
>     return merge(left, right)
> ```
> **Answer Options:**
> 
> 1. $O(1)$  
> 2. $O(\log n)$  
> 3. $O(n)$  
> 4. $O(n \log n)$

<details close>
<summary><b>Show Solution</b></summary>
<div markdown="1">

**Explanation:**  
When merge sorting a linked list recursively, the splitting process is done in place without extra arrays. However, the recursion call stack is used. Since the list is divided roughly in half at each recursion, the maximum recursion depth is $O(\log n)$.

**Auxiliary Space Complexity:** $O(\log n)$.

**Final Answer:**  
$\boxed{O(\log n)}$
</div>
</details>



*This concludes our set of 10 exercises on space complexity. Happy coding and memory-smart programming!* 😊
