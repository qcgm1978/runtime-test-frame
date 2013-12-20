# questions from relevant part of https://github.com/darcyclarke/Front-end-Developer-Interview-Questions#js
'use strict'

describe 'js questions',->
    Func=->
    Func.prototype.test=->
        this
    a=Func()
    it 'What\'s the difference between a variable that is: null, undefined or undeclared?',->
        a=null
        b=undefined
        expect(a is b).not.toEqual()
        expect(a? and b?).toBeFalsy()
        expect(`a==b`).toBeTruthy()
        expect(typeof a).toEqual('object')
        expect(a is null).toBeTruthy()
        expect(b is null).toBeFalsy()
        expect(typeof b).toEqual('undefined')
        expect(b is undefined).toBeTruthy()
    it 'new key word',->
        b=new Func()
        expect(a).toEqual(undefined)
        expect(-> a.test()).toThrow()
        expect(typeof b).toEqual('object')
        expect(b instanceof Function).toBeFalsy()
        expect(b instanceof Object).toBeTruthy()
        expect(b.prototype).toBeUndefined()
        expect(b.constructor).toEqual(Func)
        expect(b.test).not.toThrow()
        expect(b.test()).toEqual(b)
    it "What's the difference between .call and .apply?",->
            expect(Func.apply).toThrow()
            func=->
                arguments
            expect(func.apply(null,{})).toEqual({})
            expect(func.call(null,{})).toEqual({0:{}})
            expect(func.apply(null,[])).toEqual([])
            expect(func.call(null,[])).toEqual({0:[]})
            expect(func.call(null,[],{})).toEqual({0:[],1:{}})
            expect(func.apply(null,[],{})).toEqual({})
            expect(func.apply(null,[{}])).toEqual({0:{}})
            func1=(a,b)->
                a+b
            expect(func1.apply(null,[1,2])).toEqual(3)
            expect(func1.call(null,[1,2])).not.toEqual(3)
            expect(func1.call(null,1,2)).toEqual(3)
    it 'explain Function.prototype.bind?',->
        expect(Function.prototype.bind instanceof Function).toBeTruthy()
        func=->
            this
        expect(func.apply()).toBeUndefined()
        expect(func.call()).toBeUndefined()
        expect(func.bind() instanceof Function).toBeTruthy()
        expect(this).toBeDefined()
        expect(func.bind(this)()).toEqual(this)
        expect(func.bind(null)()).toEqual(null)
    it 'Make this work: javascript [1,2,3,4,5].duplicate(); // [1,2,3,4,5,1,2,3,4,5]',->
        Array.prototype.duplicate=->
            this.concat(this)
        arr = [1, 2, 3, 4, 5]
        expect(arr.duplicate instanceof Function).toBeTruthy()
        expect(arr.duplicate()).toEqual([1,2,3,4,5,1,2,3,4,5])




