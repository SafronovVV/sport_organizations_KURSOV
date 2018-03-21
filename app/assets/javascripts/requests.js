$('.requests.new').ready(() => {
  $('#dialogOnRequest').modal('show');
})

function participantRequest(){
  $('#requestParticipantSelector, #requestIsIllSelector').removeClass('d-none');
  $('#requestClubSelector').addClass('d-none');
  $('#dialogOnRequest').modal('hide')
}

function clubRequest(){
  $('#requestClubSelector').removeClass('d-none');
  $('#requestParticipantSelector, #requestIsIllSelector').addClass('d-none');
  $('#dialogOnRequest').modal('hide')
}
