# Spiv Proxy

Spiv Proxy is a set of [Terraform](https://www.terraform.io/) scripts that simplify the setup of a personal Socks5 Proxy.

## Deploy the Spiv Server

The easiest way to get a Spiv server running is to let it set up a _new_ virtual machine in the cloud for you.

1. **Setup an account on a cloud hosting provider.** Spiv supports [DigitalOcean](https://m.do.co/c/c97551d0c3d6)

2. **[Download Spiv](https://github.com/jackivanov/spiv/archive/master.zip).** Unzip it in a convenient location on your local machine.

3. **Install Terraform.**

    - macOS:
      ```bash
      $ brew install terraform
      ```
3. **List the users to create.** Open the Terminal. `cd` into the `spiv-master` directory where you unzipped Spiv, open `config.auto.tfvars` in your favorite text editor. Specify the users you wish to create in the `users` list.

4. **Start the deployment.** Return to your terminal. In the Spiv directory, run:

      ```bash
      $ terraform init cloud/digitalocean/
      $ terraform apply cloud/digitalocean/
      ```

That's it! You will get the message below when the server deployment process completes.
