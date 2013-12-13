'use strict'
describe 'Top 10 Movies for Programmers',->
    it 'The Matrix',->
        createWorld=->
            start={}
            arr=[0..Infinity]
            arr[-1]='God'
            arr[0]=start
            lightSpeed=3*1e8


    expect([1..3]).toEqual([1,2,3])
    temp = []
    temp[-1] = 'God'
    expect(temp[-1]).toEqual('God' )
    expect(temp.length).toEqual(0)
    expect(String(1e8).length-1).toEqual(8)