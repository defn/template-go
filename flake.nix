{
  inputs.lib.url = github:defn/lib/0.0.66;
  outputs = inputs: inputs.lib.goMain rec {
    src = ./.;

    generateCompletion = "1";
  };
}
