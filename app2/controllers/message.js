import fetch from "node-fetch";

class Message {
  static reverseMessage(req, res) {
    const url = 'http://signavio-app1-service.default.svc.cluster.local';

    // Get the message from the other service
    async function getMessage() {
      let response = await fetch(url);
      if (!response) {
        return res.status(500).send({
          "message": "An error occur. Could not fetch URL. Make sure URL is valid and live"
        })
      }
      if (response.status === 200) {
          return await response.json();
      }
  }
  
  // Invert the message
  getMessage()
  .then(responseText => {
    const responseData = responseText.message.split("").reverse().join("")
    return res.status(200).send(
      responseData
    )
  })
  }
}
export default Message;