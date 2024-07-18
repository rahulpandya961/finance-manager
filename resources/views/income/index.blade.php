<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>Income Form</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
            <div id="successMessage" class="alert alert-success" style="display: none;">
                    Income added successfully!
                </div>
                <div id="successMessage_update" class="alert alert-success" style="display: none;">
                    Income updated successfully!
                </div>
                <h2>Add Income</h2>

                <form id="addIncomeForm">
                    @csrf

                    <div class="mb-3">
                        <label for="amount" class="form-label">Amount</label>
                        <input type="number" class="form-control" id="amount" name="amount">
                        <span id="amountError" class="invalid-feedback">Please enter the amount.</span>
                    </div>

                    <div class="mb-3">
                        <label for="category" class="form-label">Category</label>
                        <input type="text" class="form-control" id="category" name="category">
                        <span id="categoryError" class="invalid-feedback">Please enter the category.</span>
                    </div>

                    <div class="mb-3">
                        <label for="description" class="form-label">Description</label>
                        <input type="text" class="form-control" id="description" name="description">
                        <span id="descriptionError" class="invalid-feedback">Please enter the description.</span>
                    </div>

                    <button type="submit" class="btn btn-primary">Add Income</button>
                </form>
                <!-- Add this modal after your form -->
                <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="editModalLabel">Edit Income</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form id="editIncomeForm">
                                    <input type="hidden" id="editId" name="editId">
                                    <!-- Hidden field to store income ID -->

                                    <div class="mb-3">
                                        <label for="editAmount" class="form-label">Amount</label>
                                        <input type="number" class="form-control" id="editAmount" name="editAmount">
                                        <span id="amountError_update" class="invalid-feedback">Please enter the
                                        amount.</span>
                                    </div>

                                    <div class="mb-3">
                                        <label for="editCategory" class="form-label">Category</label>
                                        <input type="text" class="form-control" id="editCategory" name="editCategory">
                                        <span id="categoryError_update" class="invalid-feedback">Please enter the
                                            category.</span>
                                    </div>

                                    <div class="mb-3">
                                        <label for="editDescription" class="form-label">Description</label>
                                        <input type="text" class="form-control" id="editDescription"
                                            name="editDescription">
                                        <span id="descriptionError_update" class="invalid-feedback">Please enter the
                                            description.</span>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-primary" id="saveEditBtn">Save changes</button>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="card">
                <div class="card-header">
                    Income List
                </div>
                <div class="card-body">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Amount</th>
                                <th>Category</th>
                                <th>Description</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody id="incomeList">
                            <!-- Income rows will be inserted here dynamically -->
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <!-- <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> -->

    <script>
    function fetchIncomes() {
        fetch('/api/incomes/get', {
                method: 'GET',
                headers: {
                    'Authorization': 'Bearer your_access_token_here'
                }
            })
            .then(response => response.json())
            .then(data => {
                const incomeList = document.getElementById('incomeList');
                incomeList.innerHTML = ''; // Clear previous entries
                data.forEach(income => {
                    const row = document.createElement('tr');
                    row.innerHTML = `
                <td>${income.id}</td>
                <td>${income.amount}</td>
                <td>${income.category}</td>
                <td>${income.description}</td>
                <td>
                    <button class="btn btn-sm btn-primary edit-btn" data-income-id="${income.id}">Edit</button>
                    <button class="btn btn-sm btn-danger delete-btn" data-income-id="${income.id}">Delete</button>
                </td>
            `;

                    // Add event listener to edit button
                    const editButton = row.querySelector('.edit-btn');
                    editButton.addEventListener('click', () => {
                        const incomeId = editButton.getAttribute('data-income-id');
                        // Fetch income details for editing
                        fetch(`/api/incomes/${incomeId}/edit`, {
                                method: 'GET',
                                headers: {
                                    'Authorization': 'Bearer your_access_token_here'
                                }
                            })
                            .then(response => response.json())
                            .then(incomeDetails => {
                                // Populate the form fields with income details for editing
                                document.getElementById('editId').value = incomeDetails.id;
                                document.getElementById('editAmount').value = incomeDetails
                                    .amount;
                                document.getElementById('editCategory').value = incomeDetails
                                    .category;
                                document.getElementById('editDescription').value = incomeDetails
                                    .description;
                                $('#editModal').modal('show');
                            })
                            .catch(error => console.error(
                                'Error fetching income details for editing:', error));
                    });

                    // Add event listener to delete button
                    const deleteButton = row.querySelector('.delete-btn');
                    deleteButton.addEventListener('click', () => {
                        const incomeId = deleteButton.getAttribute('data-income-id');
                        deleteIncome(incomeId); // Call your delete function here
                    });

                    incomeList.appendChild(row);
                });
            })
            .catch(error => console.error('Error fetching incomes:', error));
    }

    function deleteIncome(incomeId) {
        fetch(`/api/incomes/delete/${incomeId}`, {
            method: 'DELETE',
            headers: {
                'Authorization': 'Bearer your_access_token_here'
            }
        })
        .then(response => {
            if (response.ok) {
                console.log(`Income ${incomeId} deleted successfully.`);
                fetchIncomes(); // Refresh incomes after deletion
            } else {
                throw new Error('Failed to delete income.');
            }
        })
        .catch(error => console.error('Error deleting income:', error));
    }


    // Call fetchIncomes function when the page loads
    document.addEventListener('DOMContentLoaded', (event) => {
        fetchIncomes();

    });

    // Call fetchIncomes function when the page loads
    // fetchIncomes();

    document.getElementById('addIncomeForm').addEventListener('submit', function(event) {
        event.preventDefault();
        const description = document.getElementById('description');
        const amount = document.getElementById('amount');

        const category = document.getElementById('category');
        if (!amount.value.trim()) {
            amount.classList.add('is-invalid');
            document.getElementById('amountError').style.display = 'block';
        } else {
            amount.classList.remove('is-invalid');
            document.getElementById('amountError').style.display = 'none';
        }

        if (!category.value.trim()) {
            category.classList.add('is-invalid');
            document.getElementById('categoryError').style.display = 'block';
        } else {
            category.classList.remove('is-invalid');
            document.getElementById('categoryError').style.display = 'none';
        }

        if (!description.value.trim()) {
            description.classList.add('is-invalid');
            document.getElementById('descriptionError').style.display = 'block';
        } else {
            description.classList.remove('is-invalid');
            document.getElementById('descriptionError').style.display = 'none';
        }

        // Check if any field is invalid
        if (!description.value.trim() || !amount.value.trim() || !category.value.trim()) {
            return;
        }
        const formData = new FormData(this);
        const accessToken = localStorage.getItem('access_token');
        const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

        axios.post('/api/incomes/users', formData, {
                headers: {
                    'Content-Type': 'multipart/form-data',
                    'Authorization': `Bearer ${accessToken}`,
                    'X-CSRF-TOKEN': csrfToken
                }
            })
            .then(response => {
                setTimeout(() => {
                    // Display success message
                    document.getElementById('successMessage').style.display = 'block';

                    // Optional: Reset form and hide success message after a delay
                    document.getElementById('addexpenseForm').reset();
                    setTimeout(() => {
                        document.getElementById('successMessage').style.display = 'none';
                    }, 3000); // Hide after 3 seconds
                }, 1000);
            })
            .catch(error => {
                console.error('Error adding income:', error.response);
                // Handle error response as needed (e.g., show error message)
            });
    });
    // Function to handle saving edited income details
    document.getElementById('saveEditBtn').addEventListener('click', () => {
        const incomeId = document.getElementById('editId').value;
        const updatedAmount = document.getElementById('editAmount').value;
        const updatedCategory = document.getElementById('editCategory').value;
        const updatedDescription = document.getElementById('editDescription').value;
        const editAmount = document.getElementById('editAmount');
        const editCategory = document.getElementById('editCategory');
        const editDescription = document.getElementById('editDescription');

        if (!editAmount.value.trim()) {
            editAmount.classList.add('is-invalid');
            document.getElementById('amountError_update').style.display = 'block';
        } else {
            editAmount.classList.remove('is-invalid');
            document.getElementById('amountError_update').style.display = 'none';
        }

        if (!editCategory.value.trim()) {
            editCategory.classList.add('is-invalid');
            document.getElementById('categoryError_update').style.display = 'block';
        } else {
            editCategory.classList.remove('is-invalid');
            document.getElementById('categoryError_update').style.display = 'none';
        }

        if (!editDescription.value.trim()) {
            editDescription.classList.add('is-invalid');
            document.getElementById('descriptionError_update').style.display = 'block';
        } else {
            editDescription.classList.remove('is-invalid');
            document.getElementById('descriptionError_update').style.display = 'none';
        }

        // Check if any field is invalid
        if (!editAmount.value.trim() || !editCategory.value.trim() || !editDescription.value.trim()) {
            return;
        }

        fetch(`/api/incomes/update/${incomeId}`, {
                method: 'PUT', // Assuming your API uses PUT for updates
                headers: {
                    'Authorization': 'Bearer your_access_token_here',
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    amount: updatedAmount,
                    category: updatedCategory,
                    description: updatedDescription
                })
            })
            .then(response => {
                if (response.ok) {
                    setTimeout(() => {
                        // Display update success message
                        document.getElementById('successMessage_update').style.display = 'block';
                    }, 1000);
                    $('#editModal').modal('hide'); // Close the modal after successful update
                    fetchexpenses(); // Refresh the expense list
                } else {
                    throw new Error('Failed to update expense.');
                }
            })
            .catch(error => console.error('Error updating income:', error));
    });
    </script>


</body>

</html>