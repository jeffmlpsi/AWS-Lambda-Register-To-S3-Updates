// module.exports.handler = function(event, context, callback) {
//     console.log('Handling event: ', JSON.stringify(event));
//     callback(null, 'Success');
// };
exports.handler = async (event) => {
  console.log(event);
  console.log('Hello from Lambda!');
  return 'Hello from Lambda!';
};

