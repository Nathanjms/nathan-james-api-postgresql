const index = (request, response) => {
  response
    .status(200)
    .json({ greeting: "Welcome to my API!", author: "Nathan James" });
};

export { index };
