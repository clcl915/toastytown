const WebSocket = require('ws')

const port = 9001
const wss = new WebSocket.Server({ port: port })

let gameState = []

console.log(`running on ws://127.0.0.1:${port}`)

wss.on('connection', ws => {

  ws.on('message', message => {
    let data = JSON.parse(message)
    // console.log(data)
    //if this id exists, create a new gameState array,
    // id the id is equal to the saved id, and the new message doesnt equal the saved message, 
    // save new data to gamestate
    //else return the same
    if(gameState.filter(el => el.id == data.id).length > 0) {
    	gameState = gameState.map(el => {
    		if(el.id == data.id && el.message != data.message){
          console.log(el.id+"'s : [" + el.message + "] != [" + data.message +"]")
          return data
        }
        else if(el.id == data.id && ((el.x != data.x) || (el.y!=data.y))){
          console.log(el.id+"'s : [" + el.x + "] != [" + data.x +"]")
          return data
        }
    		else return el
    	})
    } else {
    	console.log(`new player, id: ${data.id}`)
      console.log(`new player, message: ${data.message}`)
	  	gameState.push(data)
    }
    //  console.log(JSON.stringify(gameState))
    ws.send(JSON.stringify(gameState))
  })
  //set interval function to send x y object every sec/half sec/1000
  //client side prediction 
  //if needed: calculate based on distance

  ws.on('close', (code, reason) => {
  	gameState = gameState.filter(el => el.id != parseInt(reason))
  	console.log(`player ${reason} disconnected`)
  })
//  ws.send(JSON.stringify({"test":"test"}))
})