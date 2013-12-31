'use strict'
describe('jasmine works',->
  it 'basic test',->
    expect(describe).toBeDefined()
)

describe('12 essential skills for software architects',->
  arr=['business skills', 'personal skills','relational skills','technical skills']
  it 'the num of software architects\'s skills',->
    expect(arr.length).toEqual 4
)
describe('software architecture in practice',->
  it 'chapter 1: what is software architecture?',->
    arr=['elements', 'relations', 'properties']
    arr1=['static modules','dynamic relations','allocation structure for mapping from structure to human']
    expect(arr.length).toEqual arr1.length
)

describe 'the process of software architecting',->
  architecture=
    structure:'uml components diagram'
    behavior:'components interaction'
    elements:'performance etc'
    tradeoff:'demand definition'
    implementation:'logic'
    style:'patterns'
    environment:'feedback'
    team:'phisical environment'
    doc:'tame time'
    relation:['workers', 'hardware','information']
  expect(architecture).toBeDefined()
describe 'software build system - principles and experience',->
