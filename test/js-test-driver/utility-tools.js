// Generated by CoffeeScript 1.6.3
(function() {
  'use strict';
  var bookName, exports, getSpecName, judgeExpression, wrapJudgeExpression;

  judgeExpression = function(parameter) {
    if (!parameter) {
      throw new Error('error');
    }
  };

  getSpecName = function() {
    return this.env.currentRunner_.queue.blocks[0].description;
  };

  wrapJudgeExpression = function(expression) {
    return judgeExpression.bind(null, expression);
  };

  exports = this;

  this.judgeExpression = judgeExpression;

  this.wrapJudgeExpression = wrapJudgeExpression;

  this.getSpecName = getSpecName;

  bookName = 'test jasmine';

  describe(bookName, function() {
    return it('test jasmine', function() {
      return expect(getSpecName.call(this)).toEqual(bookName);
    });
  });

}).call(this);

/*
//@ sourceMappingURL=utility-tools.map
*/
