#demo http://jsbin.com/ArACuWO/2/edit
'use strict'
test 'qunit wrapper',->
    equal assertException?,true
    ok assertException instanceof Function
    ok assertTrue instanceof Function
global = {}
Func = (arg)->
    priv = 'priv'
    global?.a = 1
    this?.a = 2
    this?.getPriv = ->
        priv
    this
func = new Func()
test 'create class by function', ->
    equal {a: 2}, {a: 2}
    equal typeof func, typeof {a: 2}
    ok func instanceof Object
    obj = {}
    equal Func(), undefined, 'no global this'
    equal global?.a, 1, 'side effects on global obj'
    equal this, {}
    equal this.a, undefined

test 'two ways implement methods of function class', ->
    a = new Func()
    equal a.a, 2, 'instance property is set'
    notStrictEqual(func, a)
    equal a.getPriv(), 'priv' ,'Methods defined internally'
    Func.prototype.getA = ->
        this.a + 1
    equal a.getA(), 3 ,'Methods added to the prototype'

test 'object literals', ->
    a = 1
    obj = {
        Func
        a
    }
    obj.getA = ->
        this.a
    c = new obj.Func()
    equal obj.getA(), 1, 'this in obj literal pointed to the obj'
    equal c.a, 2, 'this in instance pointed to constructor precedence over obj'

    assertException(
        ->
          throw Error
        ,
        'Error'
    )
    assertException(
        ->
          obj.getA()
        'TypeError'
    )

test 'test creating a class by Singleton using a function',->
    single=new ->
        this.color='grey'
    equal single.color,'grey'
    single.color= 'red'
    notEqual(single.color,'grey')
    equal(single.color,'red','red overwite grey that means only one single instance of this class at any time')



