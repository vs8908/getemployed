  var initialize_calender;
  initialize_calender = function(){
    $('.calender').each(function(){
      var calender = $(this);
      calender.fullCalendar({
        header: {
          right: 'today, prev,next',
          left: 'month,agendaWeek,agendaDay',
          center: 'title'
        },
        selectable: true,
        selectHelper: true,
        editable: true,
        eventLimit: true,

        events: '/events.json',
        select: function(start, end){
          $.getScript('/events/new', function(){
            $("#event_start_date").val(moment(start).format("DD/MM/YYYY HH:mm"))
            $("#event_end_date").val(moment(end).format("DD/MM/YYYY HH:mm"))
          })
          calender.fullCalendar('unselect');
        },

        eventDrop: function(event, delta, revertFunc){
          event_data = {
            event: {
              id: event.id,
              title: event.title,
              start_date: event.start.format("DD/MM/YYYY HH:mm"),
              end_date: event.end.format("DD/MM/YYYY HH:mm"),
              public: event.public
            }
          };

          $.ajax({
            url: '/events/' + event.id,
            data: event_data,
            type: 'PATCH'
          });
        },
        eventClick: function(event, jsEvent, view){
          $.getScript('/events/'+ event.id +'/edit', function(){
            $("#event_start_date").val(moment(start).format("DD/MM/YYYY HH:mm"))
            $("#event_end_date").val(moment(end).format("DD/MM/YYYY HH:mm"))
          })
          calender.fullCalendar('unselect');
        }
      });
    })
  }
  $(document).ready(function(){
    initialize_calender()
  })
  $(document).on('turbolink:load', initialize_calender())