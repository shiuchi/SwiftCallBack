# SwiftCallBack
### You can define a method with various arguments as a Callback

```Swift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let callback = Callback(log, params: "callback called!")
        let weakcallback = WeakCallback(self, handler: ViewController.log, params: ("weak callback called!"))

        callback.call() // print callback called!
        weakcallback.call() // weak callback called!
    }

    func log(str: String) {
        print(str)
    }
}

```

### Callback instance can be defined as Callable proctol

```Swift

class ViewController: UIViewController {

    let myCallback: Callable = Callback(log, params: "callback called!")

    override func viewDidLoad() {
        super.viewDidLoad()
        myCallback.call() // print callback called!
    }

    func log(str: String) {
        print(str)
    }
}
```
