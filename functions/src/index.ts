import {
  sendToDevice,
  onUserCreated,
  onUserDeleted,
  createUser,
  updateUserData,
  addActivity,
  markActivityAsRead,
  followUser,
  unfollowUser,
  likeLoop,
  unlikeLoop,
  addComment,
  deleteComment,
  uploadLoop,
  deleteLoop,
  shareLoop,
  checkUsernameAvailability,
  createBadge,
} from "./db_functions";

exports.sendToDevice = sendToDevice;
exports.onUserCreated = onUserCreated;
exports.onUserDeleted = onUserDeleted;
exports.createUser = createUser;
exports.updateUserData = updateUserData;
exports.followUser = followUser;
exports.unfollowUser = unfollowUser;
exports.uploadLoop = uploadLoop;
exports.deleteLoop = deleteLoop;
exports.likeLoop = likeLoop;
exports.unlikeLoop = unlikeLoop;
exports.addActivity = addActivity;
exports.markActivityAsRead = markActivityAsRead;
exports.addComment = addComment;
exports.deleteComment = deleteComment;
exports.shareLoop = shareLoop;
exports.checkUsernameAvailability = checkUsernameAvailability;
exports.createBadge = createBadge;
