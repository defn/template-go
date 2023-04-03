{
  inputs.app.url = github:defn/app/0.0.22;
  outputs = inputs: inputs.app.goMain rec {
    src = ./.;

    generateCompletion = "1";
  };
}
