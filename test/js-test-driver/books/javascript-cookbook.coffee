describe 'join two or more string',->
  it 'by + operator',->
    str1='str1'
    str2='str2'
    expect(str1+str2).toEqual('str1str2')
    str1+=str2
    expect(str1).toEqual('str1str2')
    expect(str1.concat str2).toEqual 'str1str2str2'
    expect(str1).toEqual 'str1str2'
    num1=1
    num2=2
    expect(num1+num2).toEqual 3