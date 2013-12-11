'use strict'
judgeExpression = (parameter) ->
#    if param is false, exception would be thrown
    if !parameter
        throw new Error('error')

wrapJudgeExpression=(expression)->
    judgeExpression.bind(null,expression)
exports=this
this.judgeExpression=judgeExpression
this.wrapJudgeExpression=wrapJudgeExpression
