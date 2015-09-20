{CompositeDisposable} = require 'atom'

RunnerPanelComponent = require './runner-panel-component'

module.exports = AtomSpecRunner =
  subscriptions: null

  activate: (state) ->
    @subscriptions = new CompositeDisposable
    @subscriptions.add atom.commands.add 'atom-workspace', 'atom-spec-runner:run-specs': => @run()
    @subscriptions.add atom.commands.add 'atom-workspace', 'atom-spec-runner:close-panel': => @close()

  deactivate: ->

  close: ->
    @runnerComponent?.element.remove()
    @panel?.destroy()

  run: ->
    console.log('Run specs')
    @runnerComponent = new RunnerPanelComponent
    @panel = atom.workspace.addBottomPanel(item: @runnerComponent.element)
