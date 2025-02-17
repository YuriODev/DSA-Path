# Solutions for Day 2 🚀

## Overview

This document provides a comprehensive overview of asymptotic analysis, including a pseudocode cost table for insertion sort, several examples demonstrating how to determine Big O notation, and a series of exercises with detailed explanations. 🚀

## Exercises

### Exercise 1: Populate Complexity 📊


> **Question:**  
> Evaluate the asymptotic complexity of the `Populate` function below, without assuming anything about the magnitudes of $M$ and $N$.

> ```cpp
> // C++
> void Populate(set<int>& unique, const vector<int>& nums) {
>   // Let nums.size() = N
>   // Let unique.size() = M
>   for (int x : nums) {  // N times
> unique.insert(x);   // O(log M) (but M grows as elements are inserted)
>   }
> }
> ```

> ```python
> # Python
> def populate(unique, nums):
>     # Let len(nums) = N
>     # Let len(unique) = M
>     for x in nums:  # N times
>         unique.add(x)  # O(log M) (but M grows as elements are inserted)
> ```

> **Answer Options:**
> 
> 1. $O(M \log(M + N))$  
> 2. $O((M + N) \log(M + N))$  
> 3. $O(N \log(M + N))$  
> 4. $O(N \log M)$  
> 5. $O(M \log N)$

<details close>
<summary><b>Show Solution</b></summary>
<div markdown="1">

**Explanation:**  
- We have **N** insertions into a balanced tree (such as `std::set`), which starts with **M** elements.  
- Each insertion takes **$O(\log(\text{current size}))$** time. As we insert elements, the set size grows from $M$ up to $M + N$.  
- Therefore, the time for the $i$-th insertion is roughly $\log(M + i)$. Summing this from $i = 0$ to $i = N - 1$ yields approximately:

$$\sum_{i=0}^{N-1} \log(M + i) \;\approx\; O\bigl(N \log(M + N)\bigr).$$


**Final Answer:**  
$\boxed{O(N \log(M + N))}$

</div>
</details>


### Exercise 2: Fibonacci Complexity 📊

> **Question:**  
> Evaluate the time complexity of the following recursive `fib` function.

> ```cpp
> // C/C++
> int fib(int N) {
>     if (N == 0 || N == 1) {
>         return 1;
>     }
>     return fib(N - 1) + fib(N - 2);
> }
> ```

> ```python
> # Python 3
> def fib(N):
>     if N == 0 or N == 1:
>         return 1
>     return fib(N - 1) + fib(N - 2)
> ```

> **Answer Options:**
> 
> 1. $O(\log N)$  
> 2. $O(N^2)$  
> 3. $O(N)$  
> 4. $O(2^N)$  
> 5. $O(N \log N)$

<details close>
<summary><b>Show Solution</b></summary>
<div markdown="1">

### Explanation

- The code computes the $N$-th Fibonacci number using a **naive** recursive approach.
- Let $T(N)$ denote the time required to compute $\text{fib}(N)$.
  - For $N = 0$ or $N = 1$, the function returns immediately, so $T(0) = T(1) = O(1)$.
  - For $N \ge 2$, the recurrence is:
    $$T(N) = T(N-1) + T(N-2).$$
- It can be shown that $T(N)$ essentially **equals** $F_N$, where $F_N$ is the $N$-th Fibonacci number.
- The Fibonacci sequence grows **exponentially**, with a base of approximately $\tfrac{1 + \sqrt{5}}{2} \approx 1.618\ldots$ (the golden ratio $\phi$).  
  - Therefore, the time complexity is about $\phi^N \approx 1.618^N$, which is close to $1.62^N$.

Hence, the **actual** asymptotic running time is on the order of:

$$\boxed{O(1.62^N)}$$

Since none of the provided choices ($\log N$, $N$, $N^2$, $2^N$, $N \log N$) matches $O(1.62^N)$, **no given option** is correct.
</div>
</details>

### Exercise 3: Quicksort Worst-Case Complexity 📊

> **Question:**  
> Evaluate the worst-case time complexity of quicksort on an array of $N$ elements using the following process:
> 1. Choose a pivot.
> 2. Partition the array into three groups: elements less than, equal to, and greater than the pivot.
> 3. Reorder the array so that the groups are consecutive.
> 4. Recursively sort the subarrays for the groups with elements less than and greater than the pivot.

> **Answer Options:**
> 
> 1. $O(N^2 \log N)$  
> 2. $O(N^N)$  
> 3. $O(N \log N)$  
> 4. $O(N^2)$  
> 5. $O(N)$

<details close>
<summary><b>Show Solution</b></summary>
<div markdown="1">

**Explanation:**  
In the worst-case scenario the pivot always partitions the array into sizes 0 and $N-1$. In one of the worst cases, the pivot chosen is always the smallest element in the array. After partitioning an array of size $N$, the recurrence becomes:  
  
$$T(N) = T(N-1) + O(N)$$  
  
Summing this over $N$ leads to:  
  
$$O(N) + O(N-1) + \dots + O(1) = O(N^2).$$  
  
**Final Answer:**  
$\boxed{O(N^2)}$

</div>
</details>

### Exercise 4: Sum of Digits Complexity 📊

> **Question:**  
> Evaluate the time complexity of the following function that computes the sum of the digits for every number in an array of size $N$ when each number is at most $C$.

> ```cpp
> int count_digit_sum(int N, int *a) {
>     int sum = 0;
>     for (int i = 0; i < N; ++i) {
>         int value = a[i];
>         while (value > 0) {
>             sum += value % 10;
>             value /= 10;
>         }
>     }
>     return sum;
> }
> ```

> ```python
> def count_digit_sum(N, a):
>     total = 0
>     for i in range(N):
>         value = a[i]
>         while value > 0:
>             total += value % 10
>             value //= 10
>     return total
> ```

> **Answer Options:**
> 
> 1. $O(N \log C)$  
> 2. $O(C)$  
> 3. $O(N)$  
> 4. $O(N \log N)$  
> 5. $O(N C)$

 
<details close>
<summary><b>Show Solution</b></summary>
<div markdown="1">

**Explanation:**  
1. **Inner Loop Analysis:**  
   For each number in the array, the inner `while` loop computes the sum of its digits. On each iteration of the `while` loop, the value is divided by 10. Since the value is at most $C$ initially, the number of iterations $k$ required satisfies:  
     
   $$10^k \le C,$$  
     
   which implies:  
     
   $$k \le \log_{10} C.$$  
     
   Therefore, the time complexity of the inner loop is $O(\log C)$.

2. **Overall Complexity:**  
   Since the inner loop is executed independently for each of the $N$ elements in the array, the overall time complexity of the function is:  
     
   $$O\left(N \cdot \log C\right).$$  

> **Final Answer:**  
> $\boxed{O(N \log C)}$

</div>
</details>


### Exercise 5: Asymptotic Complexity with a While and For Loop 📊

> **Question:**  
> Evaluate the time complexity of the following code snippet, where $a$ is an array of size $N$:

> ```cpp
> int f(int N, int *a) {
>     int answer = 0;
>     int L = 0;
>     int R = N - 1;
> 
>     while (R >= L) {
>         for (int i = L; i <= R; i += 5) {
>             answer += a[i];
>         }
>         if (answer % 2 == 0) {
>             ++L;
>         } else {
>             --R;
>         }
>     }
>     return answer;
> }
> ```

> ```python
> def f(N, a):
>     answer = 0
>     L = 0
>     R = N - 1
>     while R >= L:
>         for i in range(L, R + 1, 5):
>             answer += a[i]
>         if answer % 2 == 0:
>             L += 1
>         else:
>             R -= 1
>     return answer
> ```
> **Answer Options:**
> 
> 1. $O\left(\frac{N^2}{5}\right)$  
> 2. $O(N^2)$  
> 3. $O(N^2 + N)$  
> 4. $O(N)$  
> 5. $O(N \log N)$

<details close>
<summary><b>Show Solution</b></summary>
<div markdown="1">


**Explanation:**

1. **Inner `for` Loop:**  
   The exact number of operations performed by the inner loop is  

   $$\left\lceil \frac{R - L + 1}{5} \right\rceil.$$  
  
   However, since we are interested only in the asymptotic complexity, we can say that the number of operations in the inner loop is, up to a constant factor, proportional to $(R - L)$ (here, the constant is approximately $1/5$). Denote this constant by $C$; then the inner loop performs at most $C \cdot (R - L)$ operations.

2. **Outer `while` Loop:**  
   Now, let’s analyze how the value of $(R - L)$ changes. Notice that regardless of the value of `answer`, at each iteration of the outer loop the difference $(R - L)$ decreases by 1, because either $L$ is increased by 1 or $R$ is decreased by 1. Initially, $(R - L) = N - 1$.

3. **Total Work:**  
   - On the first iteration of the outer loop, the inner loop performs at most $C \cdot (N - 1)$ operations.
   - On the second iteration, it performs at most $C \cdot (N - 2)$ operations.
   - And so on, until the difference reaches 0.
   
   Therefore, the total number of operations is bounded by:  
     
   $$C \cdot \left[(N - 1) + (N - 2) + \dots + 2 + 1\right] = C \cdot \frac{N \cdot (N - 1)}{2}.$$  
     
   This summation is $O(N^2)$.
 
**Final Answer:**  
$\boxed{O(N^2)}$

</div>
</details>

### Exercise 6: Prime Factors Complexity 📊

> **Question:**  
> Evaluate the time complexity of the following function that computes the prime factors of a number $ x $. Let $ C $ be an upper bound on $ x $ (i.e., initially, $ x \le C $).

> ```cpp
> #include <vector>
> std::vector<int> primes(int x) {
>     std::vector<int> result;
>     int i = 2;
>     while (i * i <= x) {
>         while (x % i == 0) {
>             result.push_back(i);
>             x /= i;
>         }
>         ++i;
>     }
>     if (x != 1) {
>         result.push_back(x);
>     }
>     return result;
> }
> ```

> ```python
> def primes(x):
>     result = []
>     i = 2
>     while i * i <= x:
>         while x % i == 0:
>             result.append(i)
>             x //= i
>         i += 1
>     if x != 1:
>         result.append(x)
>     return result
> ```

> **Answer Options:**
> 
> 1. $O(C \log C)$
> 2. $O(\log C)$
> 3. $O(C + \log C)$
> 4. $O(C)$

<details close>
<summary><b>Show Solution</b></summary>
<div markdown="1">

**Explanation:**  

1. **Outer Loop Analysis:**  
   The outer `while` loop increases $i$ by 1 on each iteration and continues as long as $i^2 \le x$. Since the initial value of $x$ does not exceed $C$ (and $x$ only decreases during execution), the outer loop will perform at most $O(C)$ iterations.

2. **Inner Loop Analysis:**  
   Each time the inner loop is executed, the value $x$ is divisible by $i$ and is divided by $i$. Because $i \ge 2$, every execution of the inner loop reduces $x$ by at least a factor of 2. Therefore, the total number of iterations of the inner loop over the entire function is at most $O(\log C)$.

3. **Overall Complexity:**  
   The dominant work comes from the outer loop, which is $O(C)$, while the inner loop contributes only an additional $O(\log C)$ iterations in total. Since $O(C)$ grows asymptotically faster than $O(\log C)$, the overall time complexity is:

   $$
   O(C) + O(\log C) = O(C).
   $$



**Final Answer:**  
$\boxed{O(C)}$

</div>
</details>


### Exercise 7: Counting Sort Complexity

> **Question:**  
> Let $a$ be an array of $N$ non-negative integers such that every element does not exceed $C$. Evaluate the time complexity of the following counting sort procedure.

> ```cpp
> #include <vector>
> #include <algorithm>
> void sort(int N, int *a) {
>     if (N == 0) return;
>     int max_val = *std::max_element(a, a + N);
>     std::vector<int> count(max_val + 1, 0);
>     for (int i = 0; i < N; ++i) {
>         ++count[a[i]];
>     }
>     int pos = 0;
>     for (int i = 0; i < count.size(); ++i) {
>         while (count[i] > 0) {
>             a[pos] = i;
>             ++pos;
>             --count[i];
>         }
>     }
> }
> ```

> ```python
> def sort(a):
>     N = len(a)
>     count = [0] * (max(a) + 1)
>     for i in range(N):
>         count[a[i]] += 1
>     pos = 0
>     for i in range(len(count)):
>         while count[i] > 0:
>             a[pos] = i
>             pos += 1
>             count[i] -= 1
> ```

> **Answer Options:**
> 
> 1. $O(NC)$  
> 2. $O(C)$  
> 3. $O(NC + C^2)$  
> 4. $O(N + C)$  
> 5. $O(N)$

<details close>
<summary><b>Show Solution</b></summary>
<div markdown="1">

**Explanation:**  

This problem presents the code for sorting an array of non-negative integers using counting sort.

1. **Finding the Maximum Element:**  
   The function `std::max_element` (or `max(a)` in Python) scans the array once, so it runs in $O(N)$ time.

2. **Counting Occurrences:**  
   The first `for` loop iterates through each element of the array and increments the corresponding entry in the `count` array. This loop performs $O(N)$ operations.

3. **Reconstructing the Sorted Array:**  
   - The outer `for` loop iterates over the `count` array. Since the values in the original array do not exceed $C$, the `count` array has at most $C + 1$ elements. Thus, the outer loop runs $O(C)$ times.
   - The inner `while` loop decreases the value of `count[i]` until it reaches zero. Notice that for each element in the original array, exactly one increment was made in the `count` array. Therefore, across the entire execution, the total number of iterations of the inner `while` loop is exactly $N$.

4. **Total Complexity:**  
   - The maximum element search: $O(N)$
   - The counting loop: $O(N)$  
   - The reconstruction loop: $O(C)$ (outer loop) + $O(N)$ (total inner loop iterations)  
     
   Adding these up, the overall time complexity is:
   $$
   O(N) + O(N) + O(C) = O(N + C).
   $$

**Final Answer:**  
$\boxed{O(N + C)}$

</div>
</details>

### Exercise 8: Asymptotic Time Complexity of a Hash Function 📊

> **Question:**  
> Evaluate the asymptotic time complexity of the following hash function.

> ```cpp
> long long f(int N) {
>     int P = 101;
>     int M = 1000000007;
>     long long hash = 0;
>     while (N >= 1) {
>         for (int i = 1; i <= N; ++i) {
>             hash = (hash * P + i) % M;
>         }
>         N /= 2;
>     }
>     return hash;
> }
> ```

> ```python
> def f(N):
>     P = 101
>     M = 1000000007
>     hash = 0
>     while N >= 1:
>         for i in range(1, N + 1):
>             hash = (hash * P + i) % M
>         N //= 2
>     return hash
> ```

> **Answer Options:**
> 
> 1. $O(NP)$  
> 2. $O(N)$  
> 3. $O(N^2)$  
> 4. $O(N \log N)$

<details close>
<summary><b>Show Solution</b></summary>
<div markdown="1">

**Explanation:**  


1. **Outer Loop:**  
   On each iteration of the outer `while` loop, $N$ is halved (i.e. $N \gets N/2$). This gives us:
   $$
   O(\log N) \text{ iterations}.
   $$
   However, this does not directly imply that the total time is $O(N \log N)$.

2. **Inner Loop:**  
   For each iteration of the outer loop:
   - **First iteration:** the inner loop runs \(N\) times.
   - **Second iteration:** the inner loop runs \(N/2\) times.
   - **Third iteration:** it runs \(N/4\) times, and so on.

   The total number of iterations of the inner loop across all iterations of the outer loop is:
   $$
   N + \frac{N}{2} + \frac{N}{4} + \dots + \frac{N}{2^k},
   $$
   where $k = \log_2 N$. This geometric series sums to at most:
   $$
   N \cdot \left(1 + \frac{1}{2} + \frac{1}{4} + \dots\right) \le 2N.
   $$

3. **Total Time Complexity:**  
   Since the overall work done is the sum of the inner loop iterations, the total time complexity is:
   $$
   O(N) + O\left(\frac{N}{2}\right) + O\left(\frac{N}{4}\right) + \dots = O(2N) = O(N).
   $$

**Final Answer:**  
$\boxed{O(N)}$

</div>
</details>



### Exercise 9: Merge Sort Complexity for Maintaining a Sorted Set 📊

> **Question:**  
> Suppose we maintain a sorted set of numbers using a dynamically expanding array (e.g., a `std::vector` or Python `list`). When adding a number, we append it to the end and then sort the array using merge sort. Evaluate the time complexity of performing $N$ addition operations.

> **Answer Options:**
> 
> 1. $O(N^3)$  
> 2. $O(N \log N)$  
> 3. $O(N^2 \log N)$  
> 4. $O(N^2)$  
> 5. $O(N)$

<details close>
<summary><b>Show Solution</b></summary>
<div markdown="1">

**Explanation:**  

1. **Merge Sort Complexity:**  
   Merge sort on an array of $K$ elements runs in $O(K \log K)$ time.

2. **Sorting on Each Insertion:**  
   When adding an element, after appending it, we sort the array. At the $K$-th insertion (for $K$ from 1 to $N$), the array size is $K$, so the sorting operation takes $O(K \log K)$ time.

3. **Total Time Over $N$ Insertions:**  
   We perform this sorting step for every value of $K$ from 1 up to $N$. Therefore, the overall running time is:
   $$
   O\left(\sum_{K=1}^{N} K \log K\right).
   $$

4. **Estimating the Sum:**  
   We can lower-bound the sum by considering the terms for $K$ from $N/2$ to $N$:
   $$
   \sum_{K=1}^{N} K \log K \ge \sum_{K=\frac{N}{2}}^{N} K \log K.
   $$
   In the range $K \in \left[\frac{N}{2}, N\right]$, each $K$ is at least $\frac{N}{2}$ and $\log K$ is at least $\log \frac{N}{2}$. There are approximately $\frac{N}{2}$ such terms, so:
   $$
   \sum_{K=\frac{N}{2}}^{N} K \log K \ge \frac{N}{2} \cdot \frac{N}{2} \cdot \log\left(\frac{N}{2}\right) = O\left(N^2 \log N\right).
   $$

**Final Answer:**  
$\boxed{O(N^2 \log N)}$

</div>
</details>

### Exercise 10: Insertion Sort Complexity for Maintaining a Sorted Set

> **Question:**  
> Suppose we maintain a sorted set of numbers using a dynamically expanding array. When adding a number, we append it to the array and then sort it using insertion sort. Evaluate the time complexity of performing $N$ addition operations.

> **Answer Options:**
> 
> 1. $O(N^3)$  
> 2. $O(N \log N)$  
> 3. $O(N^2 \log N)$  
> 4. $O(N^2)$  
> 5. $O(N)$

<details close>
<summary><b>Show Solution</b></summary>
<div markdown="1">

**Explanation:**  




1. **Insertion Sort on a Nearly Sorted Array:**  
   After each addition, we sort the array using insertion sort. When the array is already sorted except for the new element at the end, insertion sort works in linear time, i.e., $O(K)$ for an array of size $K$.

2. **Cost for Each Insertion:**  
   Suppose that after $K-1$ insertions the array is sorted. When we add the $K$-th element, the array has $K$ elements and the insertion sort takes $O(K)$ time in the worst case.

3. **Total Cost Over $N$ Insertions:**  
   We perform this sorting step for each insertion from $K = 1$ to $N$. The total time is:
   $$
   O(1) + O(2) + \dots + O(N) = O\left(\sum_{K=1}^{N} K\right) = O\left(\frac{N(N+1)}{2}\right) = O(N^2).
   $$


**Final Answer:**  
$\boxed{O(N^2)}$

</div>
</details>
