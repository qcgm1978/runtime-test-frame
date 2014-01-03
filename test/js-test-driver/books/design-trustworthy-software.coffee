bookName = 'design for trustworthy software - tools, techniques, and methodology of developing robuse software'

describe bookName,->
  it 'test jasmine',->
    expect(getSpecName.call(this)).toEqual bookName