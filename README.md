# SwiftCallBack
SwiftCallBack!
インスタンスメソッド、クロージャをCallbackプロトコルとして定義可能にします

```Swift
let c = CallBack.create({
  print("called")
})

let function = { params in
  print(params)
}

let c2 = CallBack.create(h, handler: Hoge.log, params: ("called"))
        
c.call()
c2.call()

```
