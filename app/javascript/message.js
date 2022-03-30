window.addEventListener('load', function scrollToEnd(){
  const messagesArea = document.getElementById('scroll-inner');
  messagesArea.scrollTop = messagesArea.scrollHeight;
});