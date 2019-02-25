class DocumentsController < ApplicationController
  before_action :authenticate_user!
  def index
    @documents = Document.where(user_id: current_user.id).newest_first
    @by_me = SharedDocument.where(sender_id: current_user.id).newest_first
    @with_me = SharedDocument.where(receiver_id: current_user.id).newest_first
  end

  def show
    @doc = Document.find(params[:id])
    qrcode = RQRCode::QRCode.new( @doc.pdf.url)
    png = qrcode.as_png(
          resize_gte_to: false,
          resize_exactly_to: false,
          fill: 'white',
          color: 'black',
          size: 1024,
          border_modules: 4,
          module_px_size: 6,
          file: nil # path to write
          )
    path = "public/qrcodes/#{@doc.document_name}#{@doc.id}.png"
    png.save(path, :interlace => true)
  end

  def new
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)
    @document.user_id = current_user.id
    if @document.document_name.to_s.empty?
        @document.document_name = @document.pdf_file_name
    end
    if @document.save
      #redirect
      flash[:success] = "PDF uploaded successfully."
      redirect_to(documents_path)
    else
      flash[:error] = "PDF upload failed."
      render('new')
    end
  end

  def document_params
    params.require(:document).permit(:pdf, :document_name)
  end

  # def edit
  # end
  #
  # def update
  # end
  #
  # def delete
  # end
  #
  # def destroy
  # end

  def share
    @other_users = User.where.not(id: current_user.id)
    @my_files = Document.where(user_id: current_user.id)
    @shared_document = SharedDocument.new
  end

  def save_share
  end
end
