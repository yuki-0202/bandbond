window.addEventListener('load', function scrollToEnd(){
  const messagesArea = document.getElementById('scroll-inner');
  if (!messagesArea) return null;
  messagesArea.scrollTop = messagesArea.scrollHeight;
});