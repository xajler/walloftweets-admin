var mongoose = require('mongoose'),
    Schema = mongoose.Schema;

var Event = new Schema({
  name: { type: String, index: true, required: true }
});