
// Maintain two pointers and update one with a delay of n steps.

class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        if head?.next == nil {
            return nil
        }

        var headCopy1 = head
        var headCopy2 = head
        var i = 1
        while i <= n {
            headCopy1 = headCopy1?.next
            i += 1
        }

        if headCopy1 == nil { // when we looking for first node removal this will come
            return head?.next
        }

        while headCopy1?.next != nil {
            headCopy1 = headCopy1?.next
            headCopy2 = headCopy2?.next
        }

        headCopy2?.next = headCopy2?.next?.next
        return head
    }
}
