class BookFilter < WillFilter::Filter

  def model_class
    Book
  end

  def inner_joins
    [:author]
  end

  def deserialize_from_params(params)
    params["wf_type"] = "WillFilter::Filter"
    params["wf_model"] = "Book"
    params["wf_order"] = "name"
    params["wf_match"] = :any
    keylist = ["name", "author.name", "genre"]
    for i in (0..2)
      params["wf_c#{i}"] = keylist[i]
      params["wf_o#{i}"] = "contains"
      params["wf_v#{i}_0"] = params[:search].downcase
    end
    super
  end

end