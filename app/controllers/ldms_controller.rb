class LdmsController < ApplicationController

  def new
    @ldm = Ldm.new
  end

  def create
    @ldm = Ldm.new(ldm_params)
    @ldm.user = current_user
    client = OpenAI::Client.new
    response = client.completions(
      parameters: {
          model: "text-davinci-001",
          prompt: @ldm.prompt,
          max_tokens: 2000
      })
    @ldm.content = response.dig("choices", 0, "text")
    @ldm.save
    redirect_to ldm_path(@ldm)
  end

  def show
    @ldm = Ldm.find(params[:id])
  end

  private

  def ldm_params
    params.require(:ldm).permit(:missions_content, :company_name, :job_title, :prompt, :content)
  end
end
