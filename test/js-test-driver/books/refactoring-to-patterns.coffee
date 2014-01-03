describe 'test',->
  it 'test coffee reference',->
    expect(true).not.toBeFalsy()
describe 'refactoring to patterns',->
  human = 'programmer'
  bookNumber='ZWTS-2011-TP312-ker'
  arr=[
    {design:'design patterns'}
    {process:'refactoring to, towards, and away from pattern'}
    {maintance:'tdd'}
    {kiss:'Keep it simple, stupid'}
    {principalPart:human}
  ]
  it 'four programming elements and the fifth element',->
    expect(arr.length-1).toEqual 4
    expect(arr[arr.length-1].principalPart).toEqual human
