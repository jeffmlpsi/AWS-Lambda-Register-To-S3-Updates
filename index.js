
exports.handler = async (event) => {
  const now = new Date()
  const localeDate = now.toLocaleDateString('en-US', {
    year: 'numeric',
    month: '2-digit',
    day: '2-digit',
  });
  const localeTime = now.toLocaleTimeString('en-US', {
    hour: '2-digit', 
    minute: '2-digit',
    second: '2-digit',
    hour12: true, 
  })
  console.log("********************")
  const totalDateTime = `${localeDate} ${localeTime}`;
  console.log(`Current date and time: ${totalDateTime}`);
  console.log(event);
  console.log('Hello from Lambda!');
  console.log("********************")
  return 'Hello from Lambda!';

};

