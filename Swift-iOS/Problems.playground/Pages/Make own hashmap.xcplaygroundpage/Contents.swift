https://dzone.com/articles/custom-hashmap-implementation-in-java

1. Define object to store key and value

struct MyKey {
    var key
    var value
}

struct MyMap {
    var array = [MyKey]()
    
    func set(value, key) {
        myKey = MyKey(key, value)
        int position = getHash(key) % size
        array [position]  = value
    }
    
    func get(key) {
        int position = getHash(key) % size
        return array [position]
    }
}
