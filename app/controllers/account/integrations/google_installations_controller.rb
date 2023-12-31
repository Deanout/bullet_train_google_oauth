class Account::Integrations::GoogleInstallationsController < Account::ApplicationController
  account_load_and_authorize_resource :google_installation, through: :team, through_association: :integrations_google_installations

  # GET /account/teams/:team_id/integrations/google_installations
  # GET /account/teams/:team_id/integrations/google_installations.json
  def index
    # if you only want these objects shown on their parent's show page, uncomment this:
    # redirect_to [:account, @team]
  end

  # GET /account/integrations/google_installations/:id
  # GET /account/integrations/google_installations/:id.json
  def show
  end

  # GET /account/teams/:team_id/integrations/google_installations/new
  def new
  end

  # GET /account/integrations/google_installations/:id/edit
  def edit
  end

  # POST /account/teams/:team_id/integrations/google_installations
  # POST /account/teams/:team_id/integrations/google_installations.json
  def create
    respond_to do |format|
      if @google_installation.save
        format.html { redirect_to [:account, @team, :integrations_google_installations], notice: I18n.t("integrations/google_installations.notifications.created") }
        format.json { render :show, status: :created, location: [:account, @google_installation] }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @google_installation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /account/integrations/google_installations/:id
  # PATCH/PUT /account/integrations/google_installations/:id.json
  def update
    respond_to do |format|
      if @google_installation.update(google_installation_params)
        format.html { redirect_to [:account, @google_installation], notice: I18n.t("integrations/google_installations.notifications.updated") }
        format.json { render :show, status: :ok, location: [:account, @google_installation] }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @google_installation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /account/integrations/google_installations/:id
  # DELETE /account/integrations/google_installations/:id.json
  def destroy
    @google_installation.destroy
    respond_to do |format|
      format.html { redirect_to params[:return_to] || [:account, @team, :integrations_google_installations], notice: I18n.t("integrations/google_installations.notifications.destroyed") }
      format.json { head :no_content }
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def google_installation_params
    strong_params = params.require(:integrations_google_installation).permit(
      :name,
      # 🚅 super scaffolding will insert new fields above this line.
      multiple_button_values: [],
      multiple_super_select_values: [],
      # 🚅 super scaffolding will insert new arrays above this line.
    )

    assign_checkboxes(strong_params, :multiple_button_values)
    assign_select_options(strong_params, :multiple_super_select_values)
    # 🚅 super scaffolding will insert processing for new fields above this line.

    strong_params
  end
end
