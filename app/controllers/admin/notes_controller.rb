class Admin::NotesController < Admin::ApplicationController
  before_action :set_notable
  before_action :set_note, only: [:edit, :update]

  def new
    @note = @notable.notes.new
  end

  def edit; end

  def create
    @note = @notable.notes.build(note_params)
    @note.user = current_user
    if @note.save
      redirect_to [:admin, @notable], class: 'New note added'
    else
      render :new, error: 'Something went wrong, Please try again!'
    end
  end

  def update
    if @note.update(note_params)
      redirect_to [:admin, @notable], notice: 'Note updated'
    else
      redirect_to [:admin, @notable], error: 'Unable to update, please try again'
    end
  end

  private

  def set_notable
    resource, id = request.path.split('/')[2..3]
    @notable = resource.singularize.classify.constantize.find(id)
  end

  def set_note
    @note = @notable.notes.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:notable_type, :notable_id, :subject,
                                 :description)
  end
end
