### source:
wiki:http://en.wikipedia.org/wiki/List_of_cognitive_biases
wiki-Chinese: http://zh.m.wikipedia.org/wiki/%E8%AA%8D%E7%9F%A5%E5%81%8F%E8%A6%8B
###
#'use strict'
describe 'Cognitive biases are tendencies to think in certain ways',->
    it 'toEqual use == instead of === when two primitive val',->
        expect({a:1} is {a:1}).toBeFalsy()
        expect({a:1}).toEqual({a:1})
        expect(null).toEqual(undefined)

describe 'Von Restorff effect',->
    it 'That an item that sticks out is more likely to be remembered than other items',->
        a=0
        expect(judgeExpression.bind('null',a is 0)).not.toThrow()
        a=1
        expect(judgeExpression.bind('null',a is 0)).toThrow()
    it ' you could just write all your code within a self-invoking, anonymous function',->
        do ->
            a=0
            expect(judgeExpression.bind('null',a is 0)).not.toThrow()

describe 'Confirmation bias ',->
    it "The tendency to search for, interpret, focus on and remember information in a way that confirms one's preconceptions",->
        expect(1).toEqual(1)
        expect(wrapJudgeExpression(`1=='1'`)).not.toThrow()
        expect(wrapJudgeExpression(`0==''`)).not.toThrow()
    it "The solution here is to use ===",->
        expect(wrapJudgeExpression(`1==='1'`)).toThrow()
        expect(wrapJudgeExpression(`0===''`)).toThrow()

    it "for in loop will include properties and methods from further up the prototype chain",->
        class Parent
            constructor:->
                @surname='Bryant'
        class Child extends Parent
            constructor:->
                @name='Kobe'
        child=new Child()
        arr=[]
        arr.push val for prop, val of child
        expect(wrapJudgeExpression(arr.length is 1)).toThrow()
        expect(arr.length).toEqual(2)
        arr=[]
        arr.push val for own prop, val of child
        expect(wrapJudgeExpression(arr.length is 1)).not.toThrow()
        expect(arr).toEqual(['Kobe'])

describe 'Endowment effect',->
    it "In behavioral economics, the endowment effect (also known as divestiture aversion) is the hypothesis that people ascribe more value to things merely because they own them.",->
        a=0
        b=new Number(0)
        expect(a).toEqual(b)
        expect(typeof a).toNotEqual(typeof b)
        expect(typeof a).toEqual('number')
        expect(typeof b).toEqual('object')

describe "Forer effect or Barnum effect",->
    it "The observation that individuals will give high accuracy ratings to descriptions of their personality that supposedly are tailored specifically for them, but are in fact vague and general enough to apply to a wide range of people.",->
        expect(wrapJudgeExpression(43 is parseInt(`043`))).toThrow()
        expect(wrapJudgeExpression(43 is parseInt(`'043'`,10))).not.toThrow()

describe "Texas sharpshooter fallacy",->
    it "The Texas sharpshooter fallacy is an informal fallacy which is committed when differences in data are ignored, but similarities are stressed. ",->

describe 'Stereotype',->
    it "A stereotype is a thought that may be adopted about specific types of individuals or certain ways of doing things,.",->
        u = 123
        do ->
          u = (typeof u is "undefined")
          expect(wrapJudgeExpression(u is true)).toThrow()
          expect(u).toBeFalsy()
        expect(wrapJudgeExpression(u is true)).toThrow()
        expect(u).toBeFalsy()

describe 'False consensus effect',->
    it "The tendency for people to overestimate the degree to which others agree with them",->
        obj=
            p:undefined
        arr=[]
        arr.push i for prop, i of obj
        expect(arr).toEqual([undefined])
        expect(wrapJudgeExpression(arr.length is 1)).not.toThrow()
