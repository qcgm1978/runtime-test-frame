'use strict'
judgeExpression = (parameter) ->
#    if param is false, exception would be thrown
    if !parameter
        throw new Error('error')
getSpecName=->
  this.env.currentRunner_.queue.blocks[0].description;
wrapJudgeExpression=(expression)->
    judgeExpression.bind(null,expression)
exports=this
this.judgeExpression=judgeExpression
this.wrapJudgeExpression=wrapJudgeExpression
this.getSpecName= getSpecName

bookName = 'test jasmine'

describe bookName,->
  it 'test jasmine',->
    expect(getSpecName.call(this)).toEqual bookName
