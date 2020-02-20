//: [Previous](@previous)


/*
 1. We can use dispatch work item for this
 2. Custome implementation given below
 3. https://mattrajca.com/2016/04/23/canceling-blocks-in-gcd.html , using dispatch_block_cancel
 */

class BoolNumber {
    var cancelled: Bool = false
}

func cancellable_dispatch_after(when, queue, block) -> BoolNumber {
    var boolNumber = BoolNumber()
    // the newBlock only runs after "when" and only if the cancelState bool value is set to false
   newBlock = ^{
    if ( boolNumber.cancelled == false)
             block()
   };
    
   dispatch_after(when, queue, newBlock);
  return boolNumber;
}
