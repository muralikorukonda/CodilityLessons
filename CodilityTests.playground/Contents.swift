//: Playground - noun: a place where people can play

import UIKit



// Lesson 1
/*
 A binary gap within a positive integer N is any maximal sequence of consecutive zeros that is surrounded by ones at both ends in the binary representation of N.
 
 For example, number 9 has binary representation 1001 and contains a binary gap of length 2. The number 529 has binary representation 1000010001 and contains two binary gaps: one of length 4 and one of length 3. The number 20 has binary representation 10100 and contains one binary gap of length 1. The number 15 has binary representation 1111 and has no binary gaps.
 
 Write a function:
 
 int solution(int N);
 
 that, given a positive integer N, returns the length of its longest binary gap. The function should return 0 if N doesn't contain a binary gap.
 
 For example, given N = 1041 the function should return 5, because N has binary representation 10000010001 and so its longest binary gap is of length 5.
 
 Assume that:
 
 N is an integer within the range [1..2,147,483,647].
 Complexity:
 
 expected worst-case time complexity is O(log(N));
 expected worst-case space complexity is O(1).
 */
public func solution1(N : Int) -> Int {
    let str = String(N, radix: 2)
    var maxGap = 0, gapCounter = 0, gapStarted = false
    for i in str.characters {
        if i=="1" {
            if gapCounter > maxGap {
                maxGap = gapCounter
            }
            gapCounter = 0
            gapStarted = true
        } else {
            if gapStarted {
                gapCounter += 1
            }
        }
        
    }
    
    return maxGap
    
}

print(solution1(1041))


//Lesson 2 - Arrays
//Cyclic Rotation
/*
 A zero-indexed array A consisting of N integers is given. Rotation of the array means that each element is shifted right by one index, and the last element of the array is also moved to the first place.
 
 For example, the rotation of array A = [3, 8, 9, 7, 6] is [6, 3, 8, 9, 7]. The goal is to rotate array A K times; that is, each element of A will be shifted to the right by K indexes.
 
 Write a function:
 
 public func solution(inout A : [Int], _ K : Int) -> [Int]
 
 that, given a zero-indexed array A consisting of N integers and an integer K, returns the array A rotated K times.
 
 For example, given array A = [3, 8, 9, 7, 6] and K = 3, the function should return [9, 7, 6, 3, 8].
 
 Assume that:
 
 N and K are integers within the range [0..100];
 each element of array A is an integer within the range [−1,000..1,000].
 In your solution, focus on correctness. The performance of your solution will not be the focus of the assessment.
 */
public func solution2(inout A : [Int], _ K : Int) -> [Int] {
    guard A.count > 0 else {
        return []
    }
    guard K<=A.count else {
        return A
    }
    let shiftedNums = A[A.count-K ..< A.count]
    A.removeLast(shiftedNums.count)
    A.insertContentsOf(shiftedNums, at: 0)
    return A
}
var A = [1,2,3,4,5]
print(solution2(&A, 2))

//OddOccurencesInArray
/*
 A non-empty zero-indexed array A consisting of N integers is given. The array contains an odd number of elements, and each element of the array can be paired with another element that has the same value, except for one element that is left unpaired.
 
 For example, in array A such that:
 
 A[0] = 9  A[1] = 3  A[2] = 9
 A[3] = 3  A[4] = 9  A[5] = 7
 A[6] = 9
 the elements at indexes 0 and 2 have value 9,
 the elements at indexes 1 and 3 have value 3,
 the elements at indexes 4 and 6 have value 9,
 the element at index 5 has value 7 and is unpaired.
 Write a function:
 
 public func solution(inout A : [Int]) -> Int
 
 that, given an array A consisting of N integers fulfilling the above conditions, returns the value of the unpaired element.
 
 For example, given array A such that:
 
 A[0] = 9  A[1] = 3  A[2] = 9
 A[3] = 3  A[4] = 9  A[5] = 7
 A[6] = 9
 the function should return 7, as explained in the example above.
 
 Assume that:
 
 N is an odd integer within the range [1..1,000,000];
 each element of array A is an integer within the range [1..1,000,000,000];
 all but one of the values in A occur an even number of times.
 Complexity:
 
 expected worst-case time complexity is O(N);
 expected worst-case space complexity is O(1), beyond input storage (not counting the storage required for input arguments).
 Elements of input arrays can be modified.
 */
public func solution2(inout A : [Int]) -> Int {
    var temp = 0
    for i in A {
        temp = temp ^ i
    }
    return temp
}

print(solution2(&A))


//Lesson 3 - Time Complexity

//FrogJmp
/*
 A small frog wants to get to the other side of the road. The frog is currently located at position X and wants to get to a position greater than or equal to Y. The small frog always jumps a fixed distance, D.
 
 Count the minimal number of jumps that the small frog must perform to reach its target.
 
 Write a function:
 
 public func solution(X : Int, _ Y : Int, _ D : Int) -> Int
 
 that, given three integers X, Y and D, returns the minimal number of jumps from position X to a position equal to or greater than Y.
 
 For example, given:
 
 X = 10
 Y = 85
 D = 30
 the function should return 3, because the frog will be positioned as follows:
 
 after the first jump, at position 10 + 30 = 40
 after the second jump, at position 10 + 30 + 30 = 70
 after the third jump, at position 10 + 30 + 30 + 30 = 100
 Assume that:
 
 X, Y and D are integers within the range [1..1,000,000,000];
 X ≤ Y.
 Complexity:
 
 expected worst-case time complexity is O(1);
 expected worst-case space complexity is O(1).
 */

public func  solution3(X : Int, _ Y : Int, _ D : Int) -> Int {
    return Int(ceil((Double(Y)-Double(X))/Double(D)))
}

print(solution3(10, 86, 30))


//TapeEquilibrium
/*
 A non-empty zero-indexed array A consisting of N integers is given. Array A represents numbers on a tape.
 
 Any integer P, such that 0 < P < N, splits this tape into two non-empty parts: A[0], A[1], ..., A[P − 1] and A[P], A[P + 1], ..., A[N − 1].
 
 The difference between the two parts is the value of: |(A[0] + A[1] + ... + A[P − 1]) − (A[P] + A[P + 1] + ... + A[N − 1])|
 
 In other words, it is the absolute difference between the sum of the first part and the sum of the second part.
 
 For example, consider array A such that:
 
 A[0] = 3
 A[1] = 1
 A[2] = 2
 A[3] = 4
 A[4] = 3
 We can split this tape in four places:
 
 P = 1, difference = |3 − 10| = 7
 P = 2, difference = |4 − 9| = 5
 P = 3, difference = |6 − 7| = 1
 P = 4, difference = |10 − 3| = 7
 Write a function:
 
 public func solution(inout A : [Int]) -> Int
 
 that, given a non-empty zero-indexed array A of N integers, returns the minimal difference that can be achieved.
 
 For example, given:
 
 A[0] = 3
 A[1] = 1
 A[2] = 2
 A[3] = 4
 A[4] = 3
 the function should return 1, as explained above.
 
 Assume that:
 
 N is an integer within the range [2..100,000];
 each element of array A is an integer within the range [−1,000..1,000].
 Complexity:
 
 expected worst-case time complexity is O(N);
 expected worst-case space complexity is O(N), beyond input storage (not counting the storage required for input arguments).
 Elements of input arrays can be modified.
 */

public func solution3(inout A : [Int]) -> Int {
    var head = A[0]
    var tail = A[1..<A.count].reduce(0, combine: +)
    var minDif = abs(head - tail)
    
    for index in 1..<A.count-1 {
        head += A[index]
        tail -= A[index]
        if abs(head - tail) < minDif {
            minDif = abs(head - tail)
        }
    }
    
    return minDif
}
print(solution3(&A))

//PermMissingElem
/*
 A zero-indexed array A consisting of N different integers is given. The array contains integers in the range [1..(N + 1)], which means that exactly one element is missing.
 
 Your goal is to find that missing element.
 
 Write a function:
 
 public func solution(inout A : [Int]) -> Int
 
 that, given a zero-indexed array A, returns the value of the missing element.
 
 For example, given array A such that:
 
 A[0] = 2
 A[1] = 3
 A[2] = 1
 A[3] = 5
 the function should return 4, as it is the missing element.
 
 Assume that:
 
 N is an integer within the range [0..100,000];
 the elements of A are all distinct;
 each element of array A is an integer within the range [1..(N + 1)].
 Complexity:
 
 expected worst-case time complexity is O(N);
 expected worst-case space complexity is O(1), beyond input storage (not counting the storage required for input arguments).
 Elements of input arrays can be modified.
 */

public func solution3c(inout A : [Int]) -> Int {
    let supposedSum = (A.count+1) * (A.count+2)/2
    let sum = A.reduce(0, combine: +)
    return supposedSum - sum
}

print(solution3c(&A))

//Lesson 4
//FrogRiverOne
/*
 A small frog wants to get to the other side of a river. The frog is initially located on one bank of the river (position 0) and wants to get to the opposite bank (position X+1). Leaves fall from a tree onto the surface of the river.
 
 You are given a zero-indexed array A consisting of N integers representing the falling leaves. A[K] represents the position where one leaf falls at time K, measured in seconds.
 
 The goal is to find the earliest time when the frog can jump to the other side of the river. The frog can cross only when leaves appear at every position across the river from 1 to X (that is, we want to find the earliest moment when all the positions from 1 to X are covered by leaves). You may assume that the speed of the current in the river is negligibly small, i.e. the leaves do not change their positions once they fall in the river.
 
 For example, you are given integer X = 5 and array A such that:
 
 A[0] = 1
 A[1] = 3
 A[2] = 1
 A[3] = 4
 A[4] = 2
 A[5] = 3
 A[6] = 5
 A[7] = 4
 In second 6, a leaf falls into position 5. This is the earliest time when leaves appear in every position across the river.
 
 Write a function:
 
 public func solution(X : Int, inout _ A : [Int]) -> Int
 
 that, given a non-empty zero-indexed array A consisting of N integers and integer X, returns the earliest time when the frog can jump to the other side of the river.
 
 If the frog is never able to jump to the other side of the river, the function should return −1.
 
 For example, given X = 5 and array A such that:
 
 A[0] = 1
 A[1] = 3
 A[2] = 1
 A[3] = 4
 A[4] = 2
 A[5] = 3
 A[6] = 5
 A[7] = 4
 the function should return 6, as explained above.
 
 Assume that:
 
 N and X are integers within the range [1..100,000];
 each element of array A is an integer within the range [1..X].
 Complexity:
 
 expected worst-case time complexity is O(N);
 expected worst-case space complexity is O(X), beyond input storage (not counting the storage required for input arguments).
 Elements of input arrays can be modified.
 */
public func solution4a(X : Int, inout _ A : [Int]) -> Int {
    var bitmap = [Bool](count: X+1, repeatedValue: false)
    var steps = X
    for i in 0..<A.count {
        if !bitmap[A[i]] {
            bitmap[A[i]] = true
            steps -= 1
        }
        if steps == 0 {
            return i
        }
    }
    return -1
}

//PermCheck
/*
 A non-empty zero-indexed array A consisting of N integers is given.
 
 A permutation is a sequence containing each element from 1 to N once, and only once.
 
 For example, array A such that:
 
 A[0] = 4
 A[1] = 1
 A[2] = 3
 A[3] = 2
 is a permutation, but array A such that:
 
 A[0] = 4
 A[1] = 1
 A[2] = 3
 is not a permutation, because value 2 is missing.
 
 The goal is to check whether array A is a permutation.
 
 Write a function:
 
 public func solution(inout A : [Int]) -> Int
 
 that, given a zero-indexed array A, returns 1 if array A is a permutation and 0 if it is not.
 
 For example, given array A such that:
 
 A[0] = 4
 A[1] = 1
 A[2] = 3
 A[3] = 2
 the function should return 1.
 
 Given array A such that:
 
 A[0] = 4
 A[1] = 1
 A[2] = 3
 the function should return 0.
 
 Assume that:
 
 N is an integer within the range [1..100,000];
 each element of array A is an integer within the range [1..1,000,000,000].
 Complexity:
 
 expected worst-case time complexity is O(N);
 expected worst-case space complexity is O(N), beyond input storage (not counting the storage required for input arguments).
 Elements of input arrays can be modified.
 */
public func solution4b(inout A : [Int]) -> Int {
    let isPermutation = 1, isArray = 0
    
    var mark = [Bool](count: A.count+1, repeatedValue: false)
    var counter = 0
    for i in 0..<A.count {
        if A[i] >= mark.count {
            return isArray
        }
        if !mark[A[i]] {
            mark[A[i]] = true
            counter += 1
        } else {
            return isArray
        }
        print(mark)
    }
    
    return counter == A.count ? isPermutation : isArray
}
var B = [4,1,3]
print("solution4b \(solution4b(&B))")

//MissingInteger
/*
 Write a function:
 
 public func solution(inout A : [Int]) -> Int
 
 that, given a non-empty zero-indexed array A of N integers, returns the minimal positive integer (greater than 0) that does not occur in A.
 
 For example, given:
 
 A[0] = 1
 A[1] = 3
 A[2] = 6
 A[3] = 4
 A[4] = 1
 A[5] = 2
 the function should return 5.
 
 Assume that:
 
 N is an integer within the range [1..100,000];
 each element of array A is an integer within the range [−2,147,483,648..2,147,483,647].
 Complexity:
 
 expected worst-case time complexity is O(N);
 expected worst-case space complexity is O(N), beyond input storage (not counting the storage required for input arguments).
 Elements of input arrays can be modified.
 
 */
public func solution4c(inout A : [Int]) -> Int {
    var num = 1
    var dict = Dictionary<Int, Bool>()
    for i in 0..<A.count {
        if A[i] > 0 {
            dict[A[i]] = true
        }
    }

    while dict[num] != nil && dict[num]! {
        num += 1
    }
    return num
}

//MaxCounters
/*
 You are given N counters, initially set to 0, and you have two possible operations on them:
 
 increase(X) − counter X is increased by 1,
 max counter − all counters are set to the maximum value of any counter.
 A non-empty zero-indexed array A of M integers is given. This array represents consecutive operations:
 
 if A[K] = X, such that 1 ≤ X ≤ N, then operation K is increase(X),
 if A[K] = N + 1 then operation K is max counter.
 For example, given integer N = 5 and array A such that:
 
 A[0] = 3
 A[1] = 4
 A[2] = 4
 A[3] = 6
 A[4] = 1
 A[5] = 4
 A[6] = 4
 the values of the counters after each consecutive operation will be:
 
 (0, 0, 1, 0, 0)
 (0, 0, 1, 1, 0)
 (0, 0, 1, 2, 0)
 (2, 2, 2, 2, 2)
 (3, 2, 2, 2, 2)
 (3, 2, 2, 3, 2)
 (3, 2, 2, 4, 2)
 The goal is to calculate the value of every counter after all operations.
 
 Write a function:
 
 public func solution(N : Int, inout _ A : [Int]) -> [Int]
 
 that, given an integer N and a non-empty zero-indexed array A consisting of M integers, returns a sequence of integers representing the values of the counters.
 
 The sequence should be returned as:
 
 a structure Results (in C), or
 a vector of integers (in C++), or
 a record Results (in Pascal), or
 an array of integers (in any other programming language).
 For example, given:
 
 A[0] = 3
 A[1] = 4
 A[2] = 4
 A[3] = 6
 A[4] = 1
 A[5] = 4
 A[6] = 4
 the function should return [3, 2, 2, 4, 2], as explained above.
 
 Assume that:
 
 N and M are integers within the range [1..100,000];
 each element of array A is an integer within the range [1..N + 1].
 Complexity:
 
 expected worst-case time complexity is O(N+M);
 expected worst-case space complexity is O(N), beyond input storage (not counting the storage required for input arguments).
 Elements of input arrays can be modified.
 */

public func solution4d(N : Int, inout _ A : [Int]) -> [Int] {
    var counters = [Int](count: N, repeatedValue : 0)
    var maxCount = 0, resetLimit = 0

    for i in 0..<A.count {
        if A[i] >= 1 && A[i] <= N {
            if counters[A[i]-1] < resetLimit {
                counters[A[i]-1] = resetLimit + 1
            } else {
                counters[A[i]-1] += 1
            }
            if counters[A[i] - 1] > maxCount
            {
                maxCount = counters[A[i] - 1];
            }
        }
        else {
            resetLimit = maxCount
        }
        
    }
    
    for i in 0..<counters.count {
        counters[i] = max(resetLimit, counters[i])
    }
    return counters
}