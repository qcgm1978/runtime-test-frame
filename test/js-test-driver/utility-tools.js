// Generated by CoffeeScript 1.6.3
(function() {
  'use strict';
  var exports, judgeExpression, wrapJudgeExpression;

  judgeExpression = function(parameter) {
    if (!parameter) {
      throw new Error('error');
    }
  };

  wrapJudgeExpression = function(expression) {
    return judgeExpression.bind(null, expression);
  };

  exports = this;

  this.judgeExpression = judgeExpression;

  this.wrapJudgeExpression = wrapJudgeExpression;

}).call(this);

/*
//@ sourceMappingURL=utility-tools.map
*/
