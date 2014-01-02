bookName = 'design for trustworthy software - tools, techniques, and methodology of developing robuse software'
describe bookName,->
  it 'test jasmine',->
    expect(this.env.currentRunner_ .queue.blocks[0].description).toEqual bookName