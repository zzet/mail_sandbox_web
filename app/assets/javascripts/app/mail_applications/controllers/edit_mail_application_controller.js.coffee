angular.module('app.modules.mail_applications.controllers')
  .controller 'EditMailApplicationController',
    ($scope, mailApplications, Users, notifications, $state, $stateParams) ->

      mailApplications.get($stateParams.id).then (mailApp)->
        $scope.mailApp = mailApp
        Users.get().then (results)->
          $scope.users = results.users
          $scope.members = _.map($scope.mailApp.members, (member)->
            member.id
          )

      $scope.save = ->
        $scope.mailApp.member_ids = $scope.members

        $scope.form.errors = null
        notifications.clear()

        $scope.mailApp.update().then(
          -> notifications.notice('Mail Application has been successfully updated!')
        , (response) -> $scope.form.errors = response.data.errors
        )

      $scope.cancel = ->
        $state.transitionTo 'mail_applications'

      $scope.destroy = ->
        deleteMailApp = confirm('Are you sure you want to delete app and all messages?')

        if deleteMailApp
          $scope.mailApp.delete().then ->
            $state.transitionTo 'mail_applications'
