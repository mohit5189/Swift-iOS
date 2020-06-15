
/*
 from Static VS Dynamic dispatch
 
 1. Always use stack where possible, but if have so many reference type variables, use class
 2. Stack method are static dispatch and class are dynamic, static is faster
 3. Use final static where possible, it make method as static dispatch hence compiler processing reduced
 4. If you have stack with too many reference type, each ref type will sotre in heap and will have ref of Stack, so passing stack in multiple method will create lots of overhead.
 
 */
