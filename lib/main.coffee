{CompositeDisposable} = require 'atom'

RunnerPanelComponent = require './runner-panel-component'

AtomSpecRunnerPackage =
  subscriptions: null

  # Public: Activates the package.
  activate: (state) ->
    @subscriptions = new CompositeDisposable
    @subscriptions.add atom.commands.add 'atom-workspace',
      'atom-spec-runner:run-specs': => @run()
      'atom-spec-runner:close-panel': => @close()

  # Public: Deactivates the package.
  deactivate: ->
    @subscriptions?.dispose()
    @close()

  # Public: Closes the spec runner panel.
  close: ->
    @runnerComponent?.element.remove()
    @panel?.destroy()

  # Public: Opens the spec runner panel and starts the specs running.
  run: ->
    console.log('Run specs')
    @runnerComponent = new RunnerPanelComponent
    @panel = atom.workspace.addBottomPanel(item: @runnerComponent.element)

module.exports = AtomSpecRunnerPackage
