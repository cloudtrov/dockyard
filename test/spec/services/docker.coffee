'use strict'

describe 'Service: Docker', ->

  # load the service's module
  beforeEach module 'googleApp'

  # instantiate service
  Docker = {}
  beforeEach inject (_Docker_) ->
    Docker = _Docker_

  it 'should do something', ->
    expect(!!Docker).toBe true
