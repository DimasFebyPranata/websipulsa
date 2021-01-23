let url;
let produk = $("#produk").DataTable({
    responsive: true,
    scrollX: true,
    ajax: readUrl,
    columnDefs: [{
        searcable: false,
        orderable: false,
        targets: 0
    }],
    order: [
        [1, "asc"]
    ],
    columns: [
        { data: null }, 
        { data: "barcode" },
        { data: "nama" },
        { data: "provider" },
        { data: "pulsa" },
		{ data: "harga" },
        { data: "stok" },
        { data: "action" }
    ]
});

function reloadTable() {
    produk.ajax.reload()
}

function addData() {
    $.ajax({
        url: addUrl,
        type: "post",
        dataType: "json",
        data: $("#form").serialize(),
        success: res => {
            $(".modal").modal("hide");
            Swal.fire("Sukses", "Sukses Menambahkan Data", "success");
            reloadTable();
        },
        error: res => {
            console.log(res);
        }
    })
}

function remove(id) {
    Swal.fire({
        title: "Hapus",
        text: "Hapus data ini?",
        type: "warning",
        showCancelButton: true
    }).then(() => {
        $.ajax({
            url: deleteUrl,
            type: "post",
            dataType: "json",
            data: {
                id: id
            },
            success: () => {
                Swal.fire("Sukses", "Sukses Menghapus Data", "success");
                reloadTable();
            },
            error: () => {
                console.log(a);
            }
        })
    })
}

function editData() {
    $.ajax({
        url: editUrl,
        type: "post",
        dataType: "json",
        data: $("#form").serialize(),
        success: () => {
            $(".modal").modal("hide");
            Swal.fire("Sukses", "Sukses Mengedit Data", "success");
            reloadTable();
        },
        error: err => {
            console.log(err)
        }
    })
}

function add() {
    url = "add";
    $(".modal-title").html("Add Data");
    $('.modal button[type="submit"]').html("Add");
}

function edit(id) {
    $.ajax({
        url: getProdukUrl,
        type: "post",
        dataType: "json",
        data: {
            id: id
        },
        success: res => {
            $('[name="id"]').val(res.id);
            $('[name="barcode"]').val(res.barcode);
            $('[name="nama_produk"]').val(res.nama_produk);
			$('[name="provider"]').append(`<option value='${res.provider_id}'>${res.provider}</option>`);
            $('[name="pulsa"]').append(`<option value='${res.pulsa_id}'>${res.pulsa}</option>`);
            $('[name="harga"]').val(res.harga);
            $('[name="stok"]').val(res.stok);
            $(".modal").modal("show");
            $(".modal-title").html("Edit Data");
            $('.modal button[type="submit"]').html("Edit");
            url = "edit";
        },
        error: err => {
            console.log(err)
        }
    });
}
produk.on("order.dt search.dt", () => {
    produk.column(0, {
        search: "applied",
        order: "applied"
    }).nodes().each((el, val) => {
        el.innerHTML = val + 1
    });
});
$("#form").validate({
    errorElement: "span",
    errorPlacement: (err, el) => {
        err.addClass("invalid-feedback");
        el.closest(".form-group").append(err)
    },
    submitHandler: () => {
        "edit" == url ? editData() : addData()
    }
});
$("#provider").select2({
    placeholder: "Provider",
    ajax: {
        url: kategoriSearchUrl,
        type: "post",
        dataType: "json",
        data: params => ({
            provider: params.term
        }),
        processResults: data => ({
            results: data
        }),
        cache: true
    }
});
$("#pulsa").select2({
    placeholder: "Pulsa",
    ajax: {
        url: satuanSearchUrl,
        type: "post",
        dataType: "json",
        data: paras => ({
            pulsa: paras.term
        }),
        processResults: data => ({
            results: data
        }),
        cache: true
    }
});
$(".modal").on("hidden.bs.modal", () => {
    $("#form")[0].reset();
    $("#form").validate().resetForm();
});