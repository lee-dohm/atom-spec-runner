{CompositeDisposable} = require 'atom'

module.exports = AtomSpecRunner =
  subscriptions: null

  activate: (state) ->
    @subscriptions = new CompositeDisposable
    @subscriptions.add atom.commands.add 'atom-workspace', 'atom-spec-runner:run-specs': => @run()

  deactivate: ->

  run: ->
    frame = document.createElement('iframe')
    frame.width = '100%'
    atom.workspace.addBottomPanel(item: frame)
