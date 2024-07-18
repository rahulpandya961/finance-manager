<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                <div id="successMessage" class="alert alert-success" style="display: none;">
                    User Register successfully!
                </div>
                    <div class="card-header">Register</div>

                    <div class="card-body">
                        <form id="register_user">
                            @csrf
                            <div class="mb-3">
                                <label for="name" class="form-label">Name</label>
                                <input id="name" type="text" class="form-control @error('name') is-invalid @enderror"
                                    name="name">
                                    <span id="nameError" class="invalid-feedback">Please enter the
                                    name.</span>
                            </div>

                            <div class="mb-3">
                                <label for="email" class="form-label">Email</label>
                                <input id="email" type="email" class="form-control @error('email') is-invalid @enderror"
                                    name="email">
                                    <span id="emailError" class="invalid-feedback">Please enter the
                                    email.</span>
                            </div>

                            <div class="mb-3">
                                <label for="password" class="form-label">Password</label>
                                <input id="password" type="password" class="form-control" name="password">
                                <span id="passwordError" class="invalid-feedback">Please enter the
                                password.</span>
                            </div>

                            <div class="mb-3">
                                <label for="role" class="form-label">Role</label>
                                <select id="role" class="form-select @error('role') is-invalid @enderror" name="role">
                                    <option value="user">User</option>
                                    <option value="admin">Admin</option>
                                </select>
                                @error('role')
                                <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>

                            <button type="submit" class="btn btn-primary">Register</button>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>
document.getElementById('register_user').addEventListener('submit', function(event) {

    event.preventDefault();
    const name = document.getElementById('name');
    const email = document.getElementById('email');

    const password = document.getElementById('password');
    if (!email.value.trim()) {
        email.classList.add('is-invalid');
        document.getElementById('emailError').style.display = 'block';
    } else {
        email.classList.remove('is-invalid');
        document.getElementById('emailError').style.display = 'none';
    }

    if (!password.value.trim()) {
        password.classList.add('is-invalid');
        document.getElementById('passwordError').style.display = 'block';
    } else {
        password.classList.remove('is-invalid');
        document.getElementById('passwordError').style.display = 'none';
    }

    if (!name.value.trim()) {
        name.classList.add('is-invalid');
        document.getElementById('nameError').style.display = 'block';
    } else {
        name.classList.remove('is-invalid');
        document.getElementById('nameError').style.display = 'none';
    }

    // Check if any field is invalid
    if (!name.value.trim() || !email.value.trim() || !password.value.trim()) {
        return;
    }
    const formData = new FormData(this);
    const accessToken = localStorage.getItem('access_token');
    // const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

    axios.post('/api/registeruser', formData, {
            // headers: {
            //     'Content-Type': 'multipart/form-data',
            //     'Authorization': `Bearer ${accessToken}`,
            // }
        })
        .then(response => {
            setTimeout(() => {
                // Display success message
                document.getElementById('successMessage').style.display = 'block';

                // Optional: Reset form and hide success message after a delay
                document.getElementById('register_user').reset();
                setTimeout(() => {
                    document.getElementById('successMessage').style.display = 'none';
                }, 3000); // Hide after 3 seconds
            }, 1000);
            window.location.href = '/login';
        })
        .catch(error => {
            if (error.response && error.response.status === 422) {
                // Handle validation errors
                const errors = error.response.data.error;
                console.error('Validation errors:', errors);

                // Example: Display validation errors
                if (errors.email) {
                    document.getElementById('email').classList.add('is-invalid');
                    document.getElementById('emailError').innerText = errors.email[0]; // Display first error message
                    document.getElementById('emailError').style.display = 'block';
                }
                // Handle other validation errors similarly
            } else {
                console.error('Error registering user:', error.response);
                // Handle other errors as needed
            }
            // Handle error response as needed (e.g., show error message)
        });
});
</script>

</html>